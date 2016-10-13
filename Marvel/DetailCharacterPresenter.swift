//
//  DetailCharacterPresenter.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class DetailCharacterPresenter: BasePresenter {
    let ui: DetailCharacterUI

    init(ui: DetailCharacterUI) {
        self.ui = ui
    }
}
