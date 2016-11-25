//
//  CharactersRepository.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class CharacterRepository {

    private let marvelCharacterAPI: MarvelCharacterAPI

    init(marvelCharacterAPI: MarvelCharacterAPI = MarvelCharacterAPI()) {
        self.marvelCharacterAPI = marvelCharacterAPI
    }

    func getAll(params: MarvelAPI.CharactersParams) -> Observable<[MarvelCharacter]> {
        return marvelCharacterAPI.getCharacters(params: params)
    }
}
