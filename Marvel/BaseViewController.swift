//
//  BaseViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift
import SVProgressHUD

class BaseViewController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateGUI()
    }

    func updateGUI() {
    }
}

extension BaseViewController: BaseUI {
    var viewController: UIViewController { return self }
    func waitingHud(show: Bool) {
        if show {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
}
