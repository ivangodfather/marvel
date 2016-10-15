//
//  DetailCharacterDataSource.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

class DetailCharacterDataSource: NSObject, UICollectionViewDataSource {

    let character: MarvelCharacter
    var comics: [MarvelComic] = []

    init(character: MarvelCharacter) {
        self.character = character
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicCollectionViewCell.identifier, for: indexPath) as? ComicCollectionViewCell else { fatalError() }
        let comic = comics[indexPath.row]
        cell.configure(comic: comic)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier, for: indexPath) as? DetailCharacterHeaderCollectionReusableView else { fatalError() }
        cell.configureWithCharacter(character: character)
        return cell
    }
}
