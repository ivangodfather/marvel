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
        static let sb = "Characters"
        static let list = String(describing: ListCharactersViewController.self)
        static let detail = String(describing: DetailCharacterViewController.self)
    }

    private var storyboard: UIStoryboard { return UIStoryboard(name: identifiers.sb, bundle: nil) }

    func list() -> UIViewController {
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifiers.list) as? ListCharactersViewController else { fatalError() }
        vc.presenter = ListCharactersPresenter(ui: vc)
        return UINavigationController(rootViewController: vc)
    }

    func detail(character: Character, fromVC: UIViewController) {
        guard let vc = storyboard.instantiateViewController(withIdentifier: identifiers.detail) as? DetailCharacterViewController else { fatalError() }
        vc.presenter = DetailCharacterPresenter(ui: vc)
        fromVC.navigationController?.pushViewController(vc, animated: true)
    }


}
