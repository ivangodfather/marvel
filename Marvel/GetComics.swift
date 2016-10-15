//
//  GetComics.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class GetComics {

    let repository: ComicRepository
    static let pageSize = 20

    init(repository: ComicRepository = ComicRepository()) {
        self.repository = repository
    }

    func character(character: MarvelCharacter) -> Observable<[MarvelComic]> {
        let params = MarvelAPI.ComicParams(characterId: character.id)
        return repository.getComics(params: params)
    }
    
}
