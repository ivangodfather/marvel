//
//  MarvelEntity.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

struct MarvelComic {

    let id: Int
    let title: String
    let description: String
    let pageCount: Int?
    let isbn: String?
    let thumbnail: URL?

    init?(dict: [String: Any]) {
        guard let id = dict["id"] as? Int,
            let title = dict["title"] as? String,
            let description = dict["description"] as? String
            else { return nil }

        var thumbnail: URL?
        if let thumb = dict["thumbnail"] as? [String: Any],
            let path = thumb["path"] as? String,
            let ext = thumb["extension"] as? String {
            thumbnail = URL(string: "\(path).\(ext)")
        }
        isbn = dict["isbn"] as? String
        pageCount = dict["pageCount"] as? Int
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}
