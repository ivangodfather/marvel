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

class CharactersAPI {

    let parser: CharacterParser

    init(parser: CharacterParser = CharacterParser()) {
        self.parser = parser
    }

    func getAll() -> Observable<[Character]> {
        return RxAlamofire.requestJSON(.get, MarvelAPI.url, parameters: MarvelAPI.parameters() as [String : AnyObject]?).flatMap { response, data -> Observable<[Character]> in
            guard response.statusCode == 200 else { return Observable.error(MarvelError.apiError) }
            guard let data = data as? [String: Any] else { return Observable.error(MarvelError.unkown) }
            return Observable.just(self.parser.characters(dict: data))
        }
    }
    
}
