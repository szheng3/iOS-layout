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
        view = Example2View(viewController: self)
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

class NavController: UIViewController {

    fileprivate var mainView: Example3View {
        return self.view as! Example3View
    }
//
//    init(pageType: PageType) {
//        super.init()
//        title = pageType.text
//    }

    override func loadView() {
        view = Example3View()
    }

    override func viewDidLoad() {

        self.navigationItem.title = "gg"
        self.navigationItem.hidesBackButton = false
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(back))
        self.navigationItem.leftBarButtonItem = backButton

        super.viewDidLoad()
        // Do any additional setup after loading the view.


//        view.addSubview(contentView)
//        contentView.flex.


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }

    @objc func back() {
        self.dismiss(animated: true, completion: nil)
    }
}


