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
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
}
