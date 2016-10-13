//
//  CharacterParser.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class CharacterParser {

    func characterFrom(dict: [String: Any]) -> Character? {
        guard let id = dict["id"] as? Int,
            let name = dict["name"] as? String,
            let description = dict["description"] as? String
            else { return nil }
        return Character(id: id, name: name, description: description)
    }

    func characters(dict: [String: Any]) -> [Character] {
        guard let data = dict["data"] as? [String: Any],
            let results = data["results"] as? [[String: Any]]
            else { return [] }
        return results.flatMap { characterFrom(dict: $0) }
    }
}
