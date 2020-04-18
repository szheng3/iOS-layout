//
// Created by Shuai Zheng on 4/18/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//
import UIKit

class ShowTableViewCell: UITableViewCell {
    static var reuseIdentifier = "ShowTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        self.textLabel?.textColor = .white
        self.textLabel?.font = .systemFont(ofSize: 14.0)
        self.textLabel?.numberOfLines = 2
        self.textLabel?.adjustsFontSizeToFitWidth = true
        self.textLabel?.minimumScaleFactor = 0.8
        self.detailTextLabel?.textColor = .lightGray

        let accessoryView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        accessoryView.image = UIImage(named: "custom-ios-app-development1")
        self.accessoryView = accessoryView

        self.backgroundColor = .clear
        self.separatorInset = .zero
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configure(show: Show) {
        self.textLabel?.text = show.title
        self.detailTextLabel?.text = show.length
        self.imageView?.image = UIImage(named: show.image)
    }
}