//
//  GetCharacters.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import RxSwift

class GetCharacters {

    let repository: CharacterRepository
    static let pageSize = 20

    init(repository: CharacterRepository = CharacterRepository()) {
        self.repository = repository
    }

    func all(offset: Int) -> Observable<[MarvelCharacter]> {
        let params = MarvelAPI.CharactersParams(pageSize: GetCharacters.pageSize,
                                      offset: offset)
        return repository.getAll(params: params)
    }

    func filtered(name: String, offset: Int) -> Observable<[MarvelCharacter]> {
        let params = MarvelAPI.CharactersParams(pageSize: GetCharacters.pageSize,
                                      offset: offset,
                                      name: name)
        return repository.getAll(params: params)
    }

}
