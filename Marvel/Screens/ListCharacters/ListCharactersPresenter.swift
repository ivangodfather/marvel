//
//  ListCharactersPresenter.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class ListCharactersPresenter: BasePresenter {

    private var offset = 0

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
        ui.waitingHud(show: true && (offset == 0))
        getCharacters.all(offset: offset)
            .subscribe(onNext: { characters in
            (self.offset == 0) ?
                self.ui.showCharacters(characters: characters) : self.ui.appendCharacters(characters: characters)
                self.ui.waitingHud(show: false)
        }).addDisposableTo(disposeBag)
    }

    func didTap(character: MarvelCharacter) {
        characterWireframe.detail(character: character, fromVC: ui.viewController)
    }

    func tableViewDidScrollToBottom() {
        offset += GetCharacters.pageSize
        showCharacters()
    }

    func searchBarTextDidChange(text: String) {
        offset = 0
    }

}
