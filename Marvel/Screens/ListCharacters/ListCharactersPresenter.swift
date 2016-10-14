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
    let characterWireframe: CharacterWireframe

    init(ui: ListCharactersUI,
         getCharacters: GetCharacters = GetCharacters(),
         characterWireframe: CharacterWireframe = CharacterWireframe()) {
        self.ui = ui
        self.getCharacters = getCharacters
        self.characterWireframe = characterWireframe
    }

    func viewDidLoad() {
        showCharacters()
    }

    private func showCharacters() {
        getCharacters.execute().subscribe(onNext: { characters in
            self.ui.showCharacters(characters: characters)
        }).addDisposableTo(disposeBag)
    }

    func didTap(character: MarvelCharacter) {
        characterWireframe.detail(character: character, fromVC: ui.viewController)
    }

}
