//
//  ViewController.swift
//  p4
//
//  Created by Shuai Zheng on 4/16/20.
//  Copyright © 2020 Shuai Zheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var mainView: Example2View {
        return self.view as! Example2View
    }
//
//    init(pageType: PageType) {
//        super.init()
//        title = pageType.text
//    }

    override func loadView() {
        view = Example2View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.



//        view.addSubview(contentView)
//        contentView.flex.


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }
}

