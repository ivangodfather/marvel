//
//  CharacterTests.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 14/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import Marvel

class CharacterSpec: QuickSpec {

    var character: MarvelCharacter!
    let anyId = 31415
    let anyName = "Spiderman"
    let anyDescription = "Spierdeman description"
    let anyExtension = "jpg"
    let anyPath = "http://www.google.es/image"
    var anyThumbnail: String { return "\(anyPath).\(anyExtension)" }

    override func spec() {

        describe("a character") {
            describe("init", {
                it("should create a character if it has id, name, description and thumbnail") {
                    self.character = MarvelCharacter(dict: self.dictWithIdNameDescriptionAndThumbnail())
                    expect(self.character).notTo(beNil())
                    expect(self.character.id).to(equal(self.anyId))
                    expect(self.character.name).to(equal(self.anyName))
                    expect(self.character.description).to(equal(self.anyDescription))
                    expect(self.character.thumbnail?.absoluteString).to(equal(self.anyThumbnail))
                }

                it("should create a character if thumbnail is missing") {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: Keys.thumbnail))
                    expect(self.character).notTo(beNil())
                }

                it("should not create a character if id is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: Keys.id))
                    expect(self.character).to(beNil())
                })

                it("should not create a character if name is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: Keys.name))
                    expect(self.character).to(beNil())
                })

                it("should not create a character if description is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: Keys.description))
                    expect(self.character).to(beNil())
                })
            })
        }

    }

    private func dictWithIdNameDescriptionAndThumbnail() -> [String: Any] {
        let thumbnailDict = [Keys.ext: anyExtension,
                             Keys.path: anyPath]
        return [Keys.id: anyId,
                Keys.name: anyName,
                Keys.description: anyDescription,
                Keys.thumbnail: thumbnailDict]
    }

    private func dictWithout(key: String) -> [String: Any] {
        var dict  = dictWithIdNameDescriptionAndThumbnail()
        dict.removeValue(forKey: key)
        return dict
    }

    private struct Keys {
        static let id = "id"
        static let name = "name"
        static let description = "description"
        static let thumbnail = "thumbnail"
        static let path = "path"
        static let ext = "extension"
    }
}
