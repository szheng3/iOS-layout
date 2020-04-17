//
// Created by Shuai Zheng on 4/16/20.
// Copyright (c) 2020 Shuai Zheng. All rights reserved.
//

import Foundation
import FlexLayout
import PinLayout

class Example1View: UIView {
    fileprivate let rootFlexContainer = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()



    init() {
        super.init(frame: .zero)
        backgroundColor = .white

//        let view1 = BasicView(text: "View 1")
        view1.backgroundColor = .lightGray
        view2.backgroundColor = .red
        view3.backgroundColor = .yellow
        rootFlexContainer.flex.direction(.column).define { flex in
            flex.addItem(view1).height(50).direction(.row).justifyContent(.start).define { flex in
                flex.addItem(view2).width(30)
                flex.addItem(view3).width(30)

            }

        }
//        let view2 = BasicView(text: "View 2")
//        let view3 = BasicView(text: "View 3")

//        rootFlexContainer.flex.justifyContent(.center).padding(10).define { (flex) in
//            flex.addItem(view1).height(40)
//            flex.addItem(view2).height(40).marginTop(10)
////            flex.addItem(view3).height(40).marginTop(10)
//        }


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