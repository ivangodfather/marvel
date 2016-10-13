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

        var thumbnail: URL?
            if let thumb = dict["thumbnail"] as? [String: Any],
            let path = thumb["path"] as? String,
            let ext = thumb["extension"] as? String {
                thumbnail = URL(string: "\(path).\(ext)")
            }

        return Character(id: id, name: name, description: description, thumbnail: thumbnail)
    }

    func characters(dict: [String: Any]) -> [Character] {
        guard let data = dict["data"] as? [String: Any],
            let results = data["results"] as? [[String: Any]]
            else { return [] }
        return results.flatMap { characterFrom(dict: $0) }
    }
}
