//
// Created by Shuai Zheng on 4/18/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class ShowTableViewCell: UITableViewCell {
    static var reuseIdentifier = "ShowTableViewCell"
    let back = UIView()
    var leftImage = UIImage(named: "nv") {
        willSet(newValue) {
            imageViewLS.image = newValue
        }
    };
    lazy var imageViewLS: UIImageView = {
        let ui = UIImageView(image: self.leftImage);
        ui.contentMode = UIView.ContentMode.scaleAspectFit
        return ui;

    }()



    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        back.backgroundColor = .blue


        contentView.flex.direction(.row).alignItems(.center).define { flex in
            flex.addItem(imageViewLS).height(100).aspectRatio(1)
        }

//        self.textLabel?.textColor = .white
//        self.textLabel?.font = .systemFont(ofSize: 14.0)
//        self.textLabel?.numberOfLines = 2
//        self.textLabel?.adjustsFontSizeToFitWidth = true
//        self.textLabel?.minimumScaleFactor = 0.8
//        self.detailTextLabel?.textColor = .lightGray
//
//        let accessoryView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
//        accessoryView.image = UIImage(named: "custom-ios-app-development1")
//        self.accessoryView = accessoryView
//
//        self.backgroundColor = .clear
//        self.separatorInset = .zero
    }

    override func layoutSubviews() {
        contentView.flex.layout(mode: .fitContainer)

        // 1) Layout the contentView & rootFlexContainer using PinLayout


    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configure(show: Show) {
//        self.textLabel?.text = show.title
//        self.detailTextLabel?.text = show.length
        self.leftImage = UIImage(named: show.image)

    }

}