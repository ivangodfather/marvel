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

    let api: MarvelAPIEndpoints

    init(api: MarvelAPIEndpoints = MarvelAPIEndpoints()) {
        self.api = api
    }

    func getAll(params: MarvelAPI.CharactersParams) -> Observable<[MarvelCharacter]> {
        return api.getCharacters(params: params)
    }
}
