//
//  GetCharacters.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import RxSwift

class GetCharacters {

    let repository: CharactersRepository

    init(repository: CharactersRepository = CharactersRepository()) {
        self.repository = repository
    }

    func execute(params: MarvelAPI.Params) -> Observable<[MarvelCharacter]> {
        return repository.getAll(params: params)
    }
}
