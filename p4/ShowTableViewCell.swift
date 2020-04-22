//
// Created by Shuai Zheng on 4/18/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import UIKit
import FlexLayout
import PinLayout

class ShowTableViewCell: UITableViewCell {
    static var reuseIdentifier = "ShowTableViewCell"
    var leftImage = UIImage(named: "nv") {
        willSet(newValue) {
            imageViewLS.image = newValue
        }
    };
    var uiLabel: UILabel = {
        let label = UILabel();
        label.adjustsFontSizeToFitWidth = true
        return label;

    }();

    private lazy var imageViewLS: UIImageView = {
        let ui = UIImageView(image: self.leftImage);
        ui.contentMode = UIView.ContentMode.scaleAspectFit
        return ui;

    }()

    var margin: CGFloat = 8{
        didSet{
            setUpUI()
        }
    };


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpUI()

    }

    func setUpUI(){

        contentView.flex.direction(.row).alignItems(.center).define { flex in
            flex.addItem(imageViewLS).marginLeft(self.margin).height(100).aspectRatio(1).markDirty()
            flex.addItem(uiLabel);

        }

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
        self.uiLabel.text = show.title
//        self.margin=100;
//        setNeedsLayout()



    }

}