//
//  DetailCharacterHeaderCollectionViewCell.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: ComicCollectionViewCell.self)
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(comic: MarvelComic) {
        self.titleLabel.text = comic.title
    }

}
