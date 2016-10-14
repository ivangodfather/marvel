//
//  ListCharactersPresenter.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class ListCharactersPresenter: BasePresenter {

    private var offset = 0
    private let pageSize = 20
    private var apiParams: MarvelAPI.Params { return MarvelAPI.Params(pageSize: pageSize, offset: offset) }

    private let ui: ListCharactersUI
    private let getCharacters: GetCharacters
    private let characterWireframe: CharacterWireframe

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
        getCharacters.execute(params: apiParams).subscribe(onNext: { characters in
            self.ui.showCharacters(characters: characters)
        }).addDisposableTo(disposeBag)
    }

    func didTap(character: MarvelCharacter) {
        characterWireframe.detail(character: character, fromVC: ui.viewController)
    }

    func tableViewDidScrollToBottom() {
        offset += pageSize
        showCharacters()
    }

}
