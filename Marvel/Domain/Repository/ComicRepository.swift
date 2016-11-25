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

    private let marvelComicAPI: MarvelComicAPI

    init(marvelComicAPI: MarvelComicAPI = MarvelComicAPI()) {
        self.marvelComicAPI = marvelComicAPI
    }

    func getComics(params: MarvelAPI.ComicParams) -> Observable<[MarvelComic]> {
        return marvelComicAPI.getComics(params: params)
    }
    
}
