//
//  ListCharacterTableViewCell.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit

class ListCharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureWithCharacter(character: Character) {
        characterImageView.image = #imageLiteral(resourceName: "avatar")
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        characterImageView.imageURL = character.thumbnail
    }

}
