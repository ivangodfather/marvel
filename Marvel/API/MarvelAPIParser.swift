//
//  ComicParser.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class MarvelAPIParser {
    func parse<T: InitDict>(dict: [String: Any]) -> [T] {
        guard let data = dict["data"] as? [String: Any],
            let results = data["results"] as? [[String: Any]]
            else { return [] }
        return results.flatMap { T(dict: $0) }
    }
}

protocol InitDict {
    init?(dict: [String: Any])
}

extension MarvelCharacter: InitDict {}
extension MarvelComic: InitDict {}
