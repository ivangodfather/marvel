//
//  CharacterParser.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class CharacterParser {
    func characters(dict: [String: Any]) -> [Character] {
        guard let data = dict["data"] as? [String: Any],
            let results = data["results"] as? [[String: Any]]
            else { return [] }
        return results.flatMap { Character(dict: $0) }
    }
}
