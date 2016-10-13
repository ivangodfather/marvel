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
    let charactersWireframe: CharactersWireframe

    init(ui: ListCharactersUI,
         getCharacters: GetCharacters = GetCharacters(),
         charactersWireframe: CharactersWireframe = CharactersWireframe()) {
        self.ui = ui
        self.getCharacters = getCharacters
        self.charactersWireframe = charactersWireframe
    }

    func viewDidLoad() {
        showCharacters()
    }

    private func showCharacters() {
        getCharacters.execute().subscribe(onNext: { characters in
            self.ui.showCharacters(characters: characters)
        }).addDisposableTo(disposeBag)
    }

    func didTap(character: Character) {
        charactersWireframe.detail(character: character, fromVC: ui.viewController)
    }

}
