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
    let character: MarvelCharacter
    let getComics: GetComics

    init(ui: DetailCharacterUI,
         character: MarvelCharacter,
         getComics: GetComics = GetComics()) {
        self.ui = ui
        self.character = character
        self.getComics = getComics
    }

    func viewDidLoad() {
        ui.show(character: character)
        showComics()
    }

    private func showComics() {
        self.ui.waitingHud(show: true)
        getComics.character(character: character).subscribe(onNext: { comics in
            self.ui.waitingHud(show: false)
            self.ui.show(comics: comics)
        }, onError: { error in
            self.ui.waitingHud(show: false)
        }).addDisposableTo(disposeBag)
    }
}
