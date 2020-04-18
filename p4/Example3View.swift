//
// Created by Shuai Zheng on 4/17/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import UIKit

class Example3View: UIView {
    fileprivate let rootFlexContainer = UIView()
    fileprivate let contentView = UIScrollView()

    let episodeImageView = UIImageView()
    let summaryPopularityLabel = UILabel()
    let episodeTitleLabel = UILabel()
    let descriptionLabel = UILabel()

    init() {
        let series = Series()
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "custom-ios-app-development1"))

        // Popularity
        summaryPopularityLabel.text = String(repeating: "★", count: series.showPopularity)
        summaryPopularityLabel.textColor = .red

        // Year
        let yearLabel = UILabel()
        yearLabel.text = series.showYear
        yearLabel.textColor = .lightGray

        // Rating
        let ratingLabel = UILabel()
        ratingLabel.text = series.showRating
        ratingLabel.textColor = .lightGray

        // Length
        let lengthLabel = UILabel()
        lengthLabel.text = series.showLength
        lengthLabel.textColor = .lightGray

        //imageUIVIew
        let imageLabel = createImageLabel(imageName: "nan", labelName: "male")
        let nv = createImageLabel(imageName: "nv", labelName: "female")

        let description = UILabel()
        description.text = series.showDescript
        description.textColor = .lightGray
        description.numberOfLines = 0


        rootFlexContainer.flex.direction(.column).marginHorizontal(8).define { flex in
            flex.addItem(imageView).aspectRatio(of: imageView)
            flex.addItem().direction(.row).define { flex in
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


        }


        contentView.addSubview(rootFlexContainer)

        addSubview(contentView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        // 1) Layout the contentView & rootFlexContainer using PinLayout
        contentView.pin.all(pin.safeArea)
        rootFlexContainer.pin.top().left().right()

        // 2) Let the flexbox container layout itself and adjust the height
        rootFlexContainer.flex.layout(mode: .adjustHeight)

        // 3) Adjust the scrollview contentSize
        contentView.contentSize = rootFlexContainer.frame.size
    }

    func createImageLabel(imageName: String, labelName: String) -> UIView {
        let view = UIView()
        let imageView = UIImageView(image: UIImage(named: imageName))
        let label = UILabel()
        label.text = labelName
        view.flex.alignItems(.center).width(70).define { flex in
            flex.addItem(imageView).shrink(1).width(50).aspectRatio(of: imageView)
            flex.addItem(label)
        }
        return view;


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

//    let shows: [Show]


}

//struct Show {
//    let title: String
//    let length: String
//    let detail: String
//    let image: String
//    let showPopularity = 5
//}
