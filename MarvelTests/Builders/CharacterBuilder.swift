//
//  CharacterBuilder.swift
//  Marvel
//
//  Created by Ivan Ruiz on 14/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
@testable import Marvel

public class CharacterBuilder {
    public class func get(count: Int = 1) -> [MarvelCharacter] {
        return (1...count).map { MarvelCharacter(id: $0, name: "anyName \($0)", description: "anyDescription \($0)", thumbnail: nil) }
    }
}
