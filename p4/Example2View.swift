//
// Created by Shuai Zheng on 4/16/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import UIKit

class Example2View: UIView {
    fileprivate let rootFlexContainer = UIView()


    init() {
        super.init(frame: .zero)
        backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "custom-ios-app-development1"))
        let imageView2 = UIImageView(image: UIImage(named: "custom-ios-app-development1"))
        let segmentedControl = UISegmentedControl(items: ["Intro", "FlexLayout", "PinLayout"])
        segmentedControl.selectedSegmentIndex = 0

        let label = UILabel()
        label.text = "Flexbox layouting is simple, powerfull and fast.\n\nFlexLayout syntax is concise and chainable."
        label.numberOfLines = 0

        let bottomLabel = UILabel()
        bottomLabel.text = "FlexLayout/yoga is incredibly fast, its even faster than manual layout."
        bottomLabel.numberOfLines = 0

        rootFlexContainer.flex.direction(.column).define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(imageView).aspectRatio(of: imageView).alignSelf(.center).width(100)
//                flex.addItem(imageView2).aspectRatio(of: imageView2).width(100).grow(2)
                flex.addItem().direction(.column).grow(1).shrink(1).define { flex in
                    flex.addItem(segmentedControl)
                    flex.addItem(label)
                }
            }
            flex.addItem().height(1).marginHorizontal(3).marginTop(10).backgroundColor(.gray)
            flex.addItem(bottomLabel).marginTop(12)

        }


        addSubview(rootFlexContainer)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        // Layout the flexbox container using PinLayout
        // NOTE: Could be also layouted by setting directly rootFlexContainer.frame
//        rootFlexContainer.pin.all(0)
        rootFlexContainer.pin.all(pin.safeArea)

        // Then let the flexbox container layout itself
        rootFlexContainer.flex.layout()
    }

}
