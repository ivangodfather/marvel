//
//  GetCharacters.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import RxSwift

class GetCharacters {

    let api: CharactersAPI

    init(api: CharactersAPI = CharactersAPI()) {
        self.api = api
    }

    func execute() -> Observable<[Character]> {
        return api.getAll()
    }
}
