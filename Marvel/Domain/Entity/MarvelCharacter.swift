//
//  Character.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct MarvelCharacter {
    let id: Int
    let name: String
    let description: String
    let thumbnail: URL?

    init?(dict: [String: Any]) {
        guard let id = dict[Keys.id] as? Int,
            let name = dict[Keys.name] as? String,
            let description = dict[Keys.description] as? String
            else { return nil }

        var thumbnail: URL?
        if let thumb = dict[Keys.thumbnail] as? [String: Any],
            let path = thumb[Keys.path] as? String,
            let ext = thumb[Keys.ext] as? String {
            thumbnail = URL(string: "\(path).\(ext)")
        }
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }

    init(id: Int,
         name: String,
         description: String,
         thumbnail: URL?) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
}

extension MarvelCharacter {
     struct Keys {
        static let id = "id"
        static let name = "name"
        static let description = "description"
        static let thumbnail = "thumbnail"
        static let path = "path"
        static let ext = "extension"
    }
}
