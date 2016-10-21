//
//  MarvelAPI.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import CryptoSwift

class MarvelAPI {
    static let url = "https://gateway.marvel.com/v1/public/characters"
    static var publicKey = "c2e5f25aab44206e6f7accdda4a2be7b"
    static var privateKey = "accade7af2b380414e5b2578f91b3b0e7142e5d1"

    class func urlComics(characterId: Int) -> String {
        return "\(MarvelAPI.url)/\(characterId.description)/series"
    }

    struct CharactersParams {
        var pageSize: Int?
        var offset: Int?
        var name: String?

        init(pageSize: Int, offset: Int) {
            self.pageSize = pageSize
            self.offset = offset
        }

        init(pageSize: Int, offset: Int, name: String) {
            self.init(pageSize: pageSize, offset: offset)
            self.name = name
        }

        func toDict() -> [String: Any] {
            var dict = MarvelAPI.defaultParams()
            if let offset = offset { dict[Keys.offset] = offset }
            if let pageSize = pageSize { dict[Keys.pageSize] = pageSize }
            if let name = name, name.characters.count > 0 { dict[Keys.name] = name }
            return dict
        }
    }

    struct ComicParams {
        var characterId: Int
        init(characterId: Int) { self.characterId = characterId }

        func toDict() -> [String: Any] { return MarvelAPI.defaultParams() }
    }

    private static func defaultParams() -> [String: Any] {
        let timestamp = Int(Date().timeIntervalSince1970)
        return [Keys.apiKey: publicKey,
                Keys.timestamp: timestamp,
                Keys.hash: "\(timestamp)\(privateKey)\(publicKey)".md5()]
    }
}

extension MarvelAPI {
    fileprivate struct Keys {
        static let apiKey = "apikey"
        static let timestamp = "ts"
        static let hash = "hash"
        static let offset = "offset"
        static let pageSize = "limit"
        static let name = "nameStartsWith"
    }
}
