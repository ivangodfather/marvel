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
    static let pageSize = 20

    init(repository: CharactersRepository = CharactersRepository()) {
        self.repository = repository
    }

    func execute(offset: Int, name: String? = nil) -> Observable<[MarvelCharacter]> {
        let params = MarvelAPI.Params(pageSize: GetCharacters.pageSize,
                                      offset: offset,
                                      name: name)
        return repository.getAll(params: params)
    }
}
