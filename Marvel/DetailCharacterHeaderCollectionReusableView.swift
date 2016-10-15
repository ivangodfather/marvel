//
//  DetailCharacterHeaderCollectionReusableView.swift
//  Marvel
//
//  Created by Ivan Ruiz on 15/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit

class DetailCharacterHeaderCollectionReusableView: UICollectionReusableView {

    static let identifier = String(describing: DetailCharacterHeaderCollectionReusableView.self)

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var textWrapper: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textWrapper.clipsToBounds = true
        textWrapper.layer.cornerRadius = 20
    }

    func configureWithCharacter(character: MarvelCharacter) {
        characterImageView.image = #imageLiteral(resourceName: "avatar")
        textLabel.text = character.description
        if let thumb = character.thumbnail {
            characterImageView.imageURL = thumb
        }
        accessibilityLabel = "\(character.id) \(character.name)"
    }
}
