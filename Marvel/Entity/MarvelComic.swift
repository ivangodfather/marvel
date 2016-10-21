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
        guard let id = dict[Keys.id] as? Int,
            let title = dict[Keys.title] as? String,
            let description = dict[Keys.description] as? String
            else { return nil }

        var thumbnail: URL?
        if let thumb = dict[Keys.thumbnail] as? [String: Any],
            let path = thumb[Keys.path] as? String,
            let ext = thumb[Keys.ext] as? String {
            thumbnail = URL(string: "\(path).\(ext)")
        }
        isbn = dict[Keys.isbn] as? String
        pageCount = dict[Keys.pageCount] as? Int
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}

extension MarvelComic {
    struct Keys {
        static let id = "id"
        static let title = "title"
        static let description = "description"
        static let ext = "extension"
        static let thumbnail = "thumbnail"
        static let path = "path"
        static let isbn = "isbn"
        static let pageCount = "pageCount"
    }
}
