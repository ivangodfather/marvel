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

    fileprivate var currentCharacter: MarvelCharacter!
    var dataSource : DetailCharacterDataSource!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        presenter.viewDidLoad()
    }

    private func setupCollectionView() {
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        updateCollectionViewLayout(size: view.frame.size)

        self.collectionView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
        let headerNib = UINib(nibName: String(describing: DetailCharacterHeaderCollectionReusableView.self), bundle: nil)
        collectionView.register(headerNib, forSupplementaryViewOfKind: IOStickyHeaderParallaxHeader, withReuseIdentifier: DetailCharacterHeaderCollectionReusableView.identifier)

        let cellNib = UINib(nibName: String(describing: ComicCollectionViewCell.self), bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: ComicCollectionViewCell.identifier)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
        updateCollectionViewLayout(size: size)
    }

    func updateCollectionViewLayout(size: CGSize) {
        if let layout = self.collectionView.collectionViewLayout as? IOStickyHeaderFlowLayout {
            layout.parallaxHeaderReferenceSize = CGSize(width: size.width, height: getHeaderHeight(size: size))
            layout.parallaxHeaderMinimumReferenceSize = CGSize(width: UIScreen.main.bounds.size.width, height: 60)
            layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width, height: layout.itemSize.height)
            layout.parallaxHeaderAlwaysOnTop = true
            layout.disableStickyHeaders = true
            self.collectionView.collectionViewLayout = layout
        }

    }

    private func getHeaderHeight(size: CGSize) -> CGFloat {
        return size.width > size.height ? 160 : 240
    }

}

extension DetailCharacterViewController: DetailCharacterUI {
    func show(character: MarvelCharacter) {
        self.currentCharacter = character
        self.title = character.name
    }

    func show(comics: [MarvelComic]) {
        dataSource.comics = comics
        collectionView.reloadData()
    }
}

extension DetailCharacterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let orientation = UIDevice.current.orientation
        let height = orientation == .portrait ? 150 : 80
        return CGSize(width: collectionView.frame.size.width, height: CGFloat(height))
    }
}

