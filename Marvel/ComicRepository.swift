//
//  ComicRepository.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxSwift

class ComicRepository {

    let api: MarvelAPIEndpoints

    init(api: MarvelAPIEndpoints = MarvelAPIEndpoints()) {
        self.api = api
    }

    func getComics(params: MarvelAPI.ComicParams) -> Observable<[MarvelComic]> {
        return api.getComics(params: params)
    }
    
}
