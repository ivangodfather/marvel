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

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }

    private func setupCollectionView() {
        if let layout: IOStickyHeaderFlowLayout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 274)
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 180)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }

        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        let headerNib = UINib(nibName: String(describing: DetailCharacterHeaderCollectionReusableView.self), bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier)

        collectionView.dataSource = self
    }

}

extension DetailCharacterViewController: DetailCharacterUI {
    func show(character: MarvelCharacter) {
        self.title = character.name
    }
}

extension DetailCharacterViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier, for: indexPath) as! DetailCharacterHeaderCollectionReusableView

        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}
