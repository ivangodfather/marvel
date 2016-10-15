//
//  DetailCharacterViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation
import IOStickyHeader


class DetailCharacterViewController: BaseViewController {
    var presenter: DetailCharacterPresenter!

    var currentCharacter: MarvelCharacter!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }

    private func setupCollectionView() {
        if let layout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 240)
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 60)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }

        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        let headerNib = UINib(nibName: String(describing: DetailCharacterHeaderCollectionReusableView.self), bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier)

        let cellNib = UINib(nibName: String(describing: DetailCharacterCollectionViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: DetailCharacterCollectionViewCell.identifier)
        collectionView.dataSource = self
    }

}

extension DetailCharacterViewController: DetailCharacterUI {
    func show(character: MarvelCharacter) {
        self.currentCharacter = character
        self.title = character.name
    }
}

extension DetailCharacterViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCharacterCollectionViewCell.identifier, for: indexPath) as? DetailCharacterCollectionViewCell else { fatalError() }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier, for: indexPath) as? DetailCharacterHeaderCollectionReusableView else { fatalError() }
        cell.configureWithCharacter(character: currentCharacter)
        return cell
    }
}
