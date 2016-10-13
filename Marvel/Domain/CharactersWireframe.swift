//
//  CharactersWireframe.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class CharactersWireframe {

    struct identifiers {
        static let sb = "Main"
        static let listCharacters = String(describing: ListCharactersViewController.self)
    }

    private var storyboard: UIStoryboard { return UIStoryboard(name: identifiers.sb, bundle: nil) }

    func listCharacters() -> ListCharactersViewController {
        guard let charactersVC = storyboard.instantiateViewController(withIdentifier: identifiers.listCharacters) as? ListCharactersViewController else { fatalError() }
        charactersVC.presenter = ListCharactersPresenter(ui: charactersVC)
        return charactersVC
    }
}
