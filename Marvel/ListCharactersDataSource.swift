//
//  ListCharactersDataSource.swift
//  Marvel
//
//  Created by Ivan Ruiz on 14/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class ListCharactersDataSource: NSObject, UITableViewDataSource {

    var characters: [MarvelCharacter] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCharacterTableViewCell.cellId) as? ListCharacterTableViewCell else { fatalError() }
        let character = characters[indexPath.row]
        cell.configureWithCharacter(character: character)
        return cell
    }
}
