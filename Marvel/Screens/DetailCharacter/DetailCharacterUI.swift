//
//  DetailCharacterUI.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

protocol DetailCharacterUI: BaseUI {
    func show(character: MarvelCharacter)
    func show(comics: [MarvelComic])
}
