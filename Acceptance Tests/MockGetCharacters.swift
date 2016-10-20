//
//  MockCharacters.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 20/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
@testable import Marvel

class MockGetCharacters: GetCharacters {
    
    var charactersToReturn: [MarvelCharacter]?
    
    override func all(offset: Int) -> Observable<[MarvelCharacter]> {
        if let charactersToReturn = charactersToReturn { return Observable.just(charactersToReturn) }
        return Observable.error(MarvelError.unkown)
    }
    
}
