//
//  ListCharactersViewControllerTests.swift
//  Marvel
//
//  Created by Ivan Ruiz on 14/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import XCTest
@testable import Marvel

class ListCharactersViewControllerTests: XCTestCase {

    var sut: ListCharactersViewController!

    override func setUp() {
        super.setUp()
        sut = openVC().childViewControllers.first as? ListCharactersViewController
    }

    func test_tableViewIsNotNilAfterViewDidLoad() {
        sut.preloadView()

        XCTAssertNotNil(sut.tableView)
    }

    func testViewDidLoad_dataSourceIsNotNil() {
        sut.preloadView()

        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is ListCharactersDataSource)
    }

    func testTableview_numberOfRowsInSectionIsCharactersCountOfDataSource() {
        let numberOfCharacters = 5
        sut.dataSource.characters = CharacterBuilder.get(count: numberOfCharacters)

        sut.preloadView()

        XCTAssertTrue(sut.tableView.numberOfRows(inSection: 0) == numberOfCharacters)
    }

    func testShowCharacters_charactersAreDisplayedInTableview() {
        let characters = CharacterBuilder.get(count: 5)

        sut.preloadView()
        sut.showCharacters(characters: characters)

        assertCharactersAreSetInTableView(characters: characters)
    }

    private func assertCharactersAreSetInTableView(characters: [MarvelCharacter]) {
        for (index, character) in characters.enumerated() {
            let cell = sut.tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! ListCharacterTableViewCell
            XCTAssertTrue(cell.nameLabel.text == character.name)
            XCTAssertTrue(cell.descriptionLabel.text == character.description)
        }
    }

    @discardableResult
    private func openVC() -> UIViewController {
        return CharacterWireframe().list()
    }

}
