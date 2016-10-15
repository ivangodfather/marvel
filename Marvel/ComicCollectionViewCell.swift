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
    @IBOutlet weak var comicImageView: UIImageView!
    @IBOutlet weak var pagesLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(comic: MarvelComic) {
        comicImageView.image = #imageLiteral(resourceName: "avatar")
        self.titleLabel.text = comic.title
        if let thumb = comic.thumbnail {
            comicImageView.imageURL = thumb
        }
        isbnLabel.text = "ISBN: \(comic.isbn ?? "unkown")"
        pagesLabel.text = "Page count: \(comic.pageCount?.description ?? "unkown")"
        accessibilityLabel = "\(comic.id) \(comic.title)"

    }

}
