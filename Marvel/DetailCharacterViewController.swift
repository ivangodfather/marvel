//
//  DetailCharacterViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class DetailCharacterViewController: BaseViewController {
    var presenter: DetailCharacterPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

}

extension DetailCharacterViewController: DetailCharacterUI {
    func show(character: MarvelCharacter) {
        self.title = character.name
    }
}
