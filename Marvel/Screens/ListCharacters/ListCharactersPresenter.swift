//
//  ListCharactersPresenter.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class ListCharactersPresenter: BasePresenter {

    let ui: ListCharactersUI
    let getCharacters: GetCharacters

    init(ui: ListCharactersUI,
         getCharacters: GetCharacters = GetCharacters()) {
        self.ui = ui
        self.getCharacters = getCharacters
    }

    func viewDidLoad() {
        showCharacters()
    }

    private func showCharacters() {
        getCharacters.execute().subscribe(onNext: { characters in
            self.ui.showCharacters(characters: characters)
        }).addDisposableTo(disposeBag)
    }

}
