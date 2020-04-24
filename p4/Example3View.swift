//
// Created by Shuai Zheng on 4/17/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import UIKit

import FlexLayout
import PinLayout

class Example3View: UIView {
    fileprivate let rootFlexContainer = UIView()
    fileprivate let contentView = UIScrollView()

    let episodeImageView = UIImageView(image: UIImage(named: "custom-ios-app-development1"))
    let summaryPopularityLabel = UILabel()
    let episodeTitleLabel = UILabel()
    let descriptionLabel = UILabel()
    let tableView = ExpandedTableView()
    fileprivate var series: Series?
    let contentView2 = UIScrollView()
    let overview = UIView.init(frame: CGRect(x: 0, y: 0, width: 1000, height: 100))

    let imageLabel2 = UIImageView(image: UIImage(named: "custom-ios-app-development1"))
    let imageLabel3 = UIImageView(image: UIImage(named: "custom-ios-app-development1"))

    var ho: UIView = UIView()

    init() {

        super.init(frame: .zero)
        ho = createHo()


        let shows = loadShows()
        series = Series(shows: shows)
        backgroundColor = .white


        // Popularity
        summaryPopularityLabel.text = String(repeating: "★", count: series!.showPopularity)
        summaryPopularityLabel.textColor = .red

        // Year
        let yearLabel = UILabel()
        yearLabel.text = series!.showYear
        yearLabel.textColor = .lightGray

        // Rating
        let ratingLabel = UILabel()
        ratingLabel.text = series!.showRating
        ratingLabel.textColor = .lightGray

        // Length
        let lengthLabel = UILabel()
        lengthLabel.text = series!.showLength
        lengthLabel.textColor = .lightGray

        //imageUIVIew
        let imageLabel = createImageLabel(imageName: "nan", labelName: "male")
        let nv = createImageLabel(imageName: "nv", labelName: "female")

        let description = UILabel()
        description.text = series!.showDescript
        description.textColor = .lightGray
        description.numberOfLines = 0

        //TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ShowTableViewCell.self, forCellReuseIdentifier: ShowTableViewCell.reuseIdentifier)

        //scroll2

        overview.backgroundColor = UIColor.green

//        contentView2.translatesAutoresizingMaskIntoConstraints = false
//        contentView2.addSubview(overview)


        rootFlexContainer.flex.direction(.column).marginHorizontal(8).define { flex in
            flex.addItem(episodeImageView).aspectRatio(of: episodeImageView)
            flex.addItem().direction(.row).paddingTop(8).define { flex in
                flex.addItem(summaryPopularityLabel)
                flex.addItem().direction(.row).grow(1).justifyContent(.spaceAround).define { flex in
                    flex.addItem(yearLabel)
                    flex.addItem(ratingLabel)
                    flex.addItem(lengthLabel)
                }
                flex.addItem().width(100).height(1).grow(1)

            }
            flex.addItem(description).paddingVertical(8)
            flex.addItem().direction(.row).define { flex in
                flex.addItem(imageLabel)
                flex.addItem(nv)

            }

            flex.addItem(contentView2).direction(.row).define { flex in
//                flex.addItem(overview).width(1000)
                flex.addItem(ho)
//                flex.addItem(imageLabel3).width(imageLabel3.frame.size.width)
//
//                flex.addItem().direction(.column).define { flex in
//                    flex.addItem(overview)
////                    flex.addItem(imageLabel3).width(400)
//                }

            }

            flex.addItem().paddingVertical(8).define { flex in
                flex.addItem(tableView)
            }


        }


        contentView.addSubview(rootFlexContainer)

        addSubview(contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func createHo() -> UIView {
        let ui = UIView()

        ui.flex.direction(.row).define { flex in
            flex.addItem(imageLabel2).width(500)
            flex.addItem(imageLabel3).width(500)
        }
        return ui

    }

    override func layoutSubviews() {

        // 1) Layout the contentView & rootFlexContainer using PinLayout
        contentView.pin.all(pin.safeArea)
        rootFlexContainer.pin.top().left().right()

        // 2) Let the flexbox container layout itself and adjust the height
        rootFlexContainer.flex.layout(mode: .adjustHeight)

        // 3) Adjust the scrollview contentSize
        contentView.contentSize = rootFlexContainer.frame.size


//        contentView2.pin.all()
        ho.pin.top().left().bottom()
        ho.flex.layout(mode: .adjustWidth)


        contentView2.contentSize = ho.frame.size as! CGSize

    }

//    func createHo() -> UIView {
//        let view = UIView()
//        view.flex.direction(.row).define { flex in
//            flex.addItem(imageLabel2).width(500)
//            flex.addItem(imageLabel3).width(500)
//        }
//        return view
//
//
//    }

    func createImageLabel(imageName: String, labelName: String) -> UIView {
        let view = UIView()
        let imageView = UIButton()
//        (image: UIImage(named: imageName))
        imageView.setImage(UIImage(named: imageName), for: .normal)
        let label = UILabel()
        label.text = labelName
        view.flex.alignItems(.center).width(60).define { flex in
            flex.addItem(imageView).width(100%).aspectRatio(of: UIImageView(image: UIImage(named: imageName)))
            flex.addItem(label)
        }
        return view;


    }

    func loadShows() -> [Show] {
        guard let path = Bundle.main.path(forResource: "Shows", ofType: "plist"),
              let dictArray = NSArray(contentsOfFile: path) as? [[String: AnyObject]] else {
            return []
        }

        var shows: [Show] = []

        dictArray.forEach { (dict) in
            guard
                let title = dict["title"] as? String,
                let length = dict["length"] as? String,
                let detail = dict["detail"] as? String,
                let image = dict["image"] as? String
                else {
                fatalError("Error parsing dict \(dict)")
            }

            let show = Show(title: title, length: length, detail: detail, image: image)
            shows.append(show)
        }

        return shows
    }

    fileprivate func didSelectShow(show: Show) {
        // Episode image
        let image = UIImage(named: show.image)
        let imageAspectRatio = (image?.size.width ?? 1.0) / (image?.size.height ?? 1.0)
        episodeImageView.image = image
        episodeImageView.flex.aspectRatio(imageAspectRatio).markDirty()

        episodeTitleLabel.text = show.title
        episodeTitleLabel.flex.markDirty()

        descriptionLabel.text = show.detail
        descriptionLabel.flex.markDirty()

        // Force a relayout
        setNeedsLayout()
    }

}

struct Series {
    let image = "sherlock"
    let showPopularity = 5
    let showYear = "2010"
    let showRating = "TV-14"
    let showLength = "3 Series"
    let selectedShow = "S3:E3"
    let showCast = "Benedict Cumberbatch, Martin Freeman, Una Stubbs"
    let showCreators = "Mark Gatiss, Steven Moffat"
    let showDescript = "Benedict Cumberbatch, Martin Freeman, Una Stubbs.Benedict Cumberbatch, Martin Freeman, Una Stubbs.Benedict Cumberbatch, Martin Freeman, Una Stubbs.Benedict Cumberbatch, Martin Freeman, Una Stubbs.Benedict Cumberbatch, Martin Freeman, Una Stubbs,Benedict Cumberbatch, Martin Freeman, Una Stubbs,Benedict Cumberbatch, Martin Freeman, Una Stubbs,Benedict Cumberbatch, Martin Freeman, Una Stubbs"

    var shows: [Show]


}

struct Show {
    let title: String
    let length: String
    let detail: String
    let image: String
    let showPopularity = 5
}

extension Example3View: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (series?.shows.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShowTableViewCell.reuseIdentifier, for: indexPath) as! ShowTableViewCell
        cell.configure(show: (series?.shows[indexPath.row])!)
        return cell
    }

    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectShow(show: (series?.shows[indexPath.row])!)
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextItem = UIContextualAction(style: .normal, title: "gg") { (contextualAction, view, boolValue) in
            //Code I want to do here
//            view.backgroundColor=UIColor.blue
            self.series?.shows.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)

            print("gg")
        }

        let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

        return swipeActions
    }


//    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete {
//            series?.shows.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//        }
//    }
}

class ExpandedTableView: UITableView {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let nbOfCells = numberOfRows(inSection: 0)
        let cellsHeight = delegate?.tableView?(self, heightForRowAt: IndexPath(row: 0, section: 0)) ?? 0
        return CGSize(width: size.width, height: CGFloat(nbOfCells) * cellsHeight)
    }
}