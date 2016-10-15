//
//  LoginViewControllerUITests.swift
//  Marvel
//
//  Created by Ivan Ruiz on 14/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
@testable import Marvel
import RxSwift

class ListCharactersUITests: BaseUITestCase {

    private let getCharacters: MockGetCharacters = MockGetCharacters()
    private let characterWireframe = MockCharacterWireframe()

    func testSetsTitle() {
        openVC()

        tester().waitForView(withAccessibilityLabel: "List")
    }

    func testShowAllCharacters() {
        let characters = givenThereAreSomeCharacters()

        openVC()

        characters.forEach { tester().waitForView(withAccessibilityLabel: $0.name) }
    }

    func testShowDetailCharacterTappingOnCharacter() {
        let characters = givenThereAreSomeCharacters()

        openVC()

        assertShowsCharacterNameInDetail(character: characters.first!)
    }

    private func assertShowsCharacterNameInDetail(character: MarvelCharacter) {
        let tableView = tester().waitForView(withAccessibilityLabel: String(describing: ListCharactersViewController.self)) as! UITableView
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ListCharacterTableViewCell
        tester().tapView(withAccessibilityLabel: cell.accessibilityLabel)
        tester().waitForAnimationsToFinish()
        tester().waitForView(withAccessibilityLabel: character.name)
    }


    private func givenThereAreSomeCharacters() -> [MarvelCharacter] {
        let characters = (1...16).map { MarvelCharacter(id: $0, name: "anyName \($0)", description: "anyDescription \($0)", thumbnail: nil) }
        getCharacters.charactersToReturn = characters
        return characters

    }

    private func openVC() {
        let sb = UIStoryboard(name: CharacterWireframe.identifiers.sb, bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: CharacterWireframe.identifiers.list) as! ListCharactersViewController
        vc.presenter = ListCharactersPresenter(ui: vc, getCharacters: getCharacters, characterWireframe: characterWireframe)
        vc.dataSource = ListCharactersDataSource()
        presentViewController(UINavigationController(rootViewController: vc))
    }
}

class MockGetCharacters: GetCharacters {

    var charactersToReturn: [MarvelCharacter]?

    override func all(offset: Int) -> Observable<[MarvelCharacter]> {
        if let charactersToReturn = charactersToReturn { return Observable.just(charactersToReturn) }
        return Observable.error(MarvelError.unkown)
    }

}

class MockCharacterWireframe: CharacterWireframe {

}
