//
//  BaseViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class BaseViewController: UIViewController, BaseUI {
    var viewController: UIViewController { return self }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateGUI()
    }

    func updateGUI() {
    }
}
