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

    private struct apiParams {
        static let apiKey = "apikey"
        static let timestamp = "ts"
        static let hash = "hash"
        static let offset = "offset"
        static let pageSize = "limit"
    }

    struct Params {
        let pageSize: Int
        var offset: Int

         func toDict() -> [String: Any] {
            let timestamp = Int(Date().timeIntervalSince1970)
            return [apiParams.apiKey: publicKey,
                    apiParams.timestamp: timestamp,
                    apiParams.hash: "\(timestamp)\(privateKey)\(publicKey)".md5(),
                    apiParams.pageSize: pageSize,
                    apiParams.offset: offset]
        }
    }


}
