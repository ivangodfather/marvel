//
//  CharactersAPI.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

class MarvelAPIEndpoints {

    let parser: MarvelAPIParser

    init(parser: MarvelAPIParser = MarvelAPIParser()) {
        self.parser = parser
    }

    func getCharacters(params: MarvelAPI.CharactersParams) -> Observable<[MarvelCharacter]> {
        return RxAlamofire.requestJSON(.get,
                                       MarvelAPI.url,
                                       parameters: params.toDict() as [String : AnyObject]?)
            .flatMap { response, data -> Observable<[MarvelCharacter]> in
                guard response.statusCode == 200 else { return Observable.error(MarvelError.apiError) }
                guard let dict = data as? [String: Any] else { return Observable.error(MarvelError.unkown) }
                return Observable.just(self.parser.parse(dict: dict))
        }
    }

    func getComics(params: MarvelAPI.ComicParams) -> Observable<[MarvelComic]> {
        return RxAlamofire.requestJSON(.get,
                                       MarvelAPI.urlComics(characterId: params.characterId),
                                       parameters: params.toDict() as [String : AnyObject]?)
            .flatMap { response, data -> Observable<[MarvelComic]> in
                guard response.statusCode == 200 else { return Observable.error(MarvelError.apiError) }
                guard let dict = data as? [String: Any] else { return Observable.error(MarvelError.unkown) }
                return Observable.just(self.parser.parse(dict: dict))
        }
    }
    
}
