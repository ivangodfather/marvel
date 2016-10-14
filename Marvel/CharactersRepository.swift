//
//  CharactersRepository.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class CharactersRepository {

    let api: CharactersAPI

    init(api: CharactersAPI = CharactersAPI()) {
        self.api = api
    }

    func getAll(params: MarvelAPI.Params) -> Observable<[MarvelCharacter]> {
        return api.getAll(params: params)
    }
}
