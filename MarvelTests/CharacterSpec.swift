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
                    self.character = MarvelCharacter(dict: self.dictWithout(key: MarvelCharacter.Keys.thumbnail))
                    expect(self.character).notTo(beNil())
                }

                it("should not create a character if id is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: MarvelCharacter.Keys.id))
                    expect(self.character).to(beNil())
                })

                it("should not create a character if name is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: MarvelCharacter.Keys.name))
                    expect(self.character).to(beNil())
                })

                it("should not create a character if description is missing", closure: {
                    self.character = MarvelCharacter(dict: self.dictWithout(key: MarvelCharacter.Keys.description))
                    expect(self.character).to(beNil())
                })
            })
        }
    }

    private func dictWithIdNameDescriptionAndThumbnail() -> [String: Any] {
        let thumbnailDict = [MarvelCharacter.Keys.ext: anyExtension,
                             MarvelCharacter.Keys.path: anyPath]
        return [MarvelCharacter.Keys.id: anyId,
                MarvelCharacter.Keys.name: anyName,
                MarvelCharacter.Keys.description: anyDescription,
                MarvelCharacter.Keys.thumbnail: thumbnailDict]
    }

    private func dictWithout(key: String) -> [String: Any] {
        var dict  = dictWithIdNameDescriptionAndThumbnail()
        dict.removeValue(forKey: key)
        return dict
    }
    
}
