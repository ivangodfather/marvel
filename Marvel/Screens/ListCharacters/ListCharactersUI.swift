//
//  ListCharactersUI.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

protocol ListCharactersUI: BaseUI {
    func showCharacters(characters: [MarvelCharacter])
    func appendCharacters(characters: [MarvelCharacter])
}
