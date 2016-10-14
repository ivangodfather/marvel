//
//  ListCharacterTableViewCell.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit

class ListCharacterTableViewCell: UITableViewCell {

    static let cellId = String(describing: ListCharacterTableViewCell.self)

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateGUI()
    }

    private func updateGUI() {
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }

    func configureWithCharacter(character: MarvelCharacter) {
        characterImageView.image = #imageLiteral(resourceName: "avatar")
        nameLabel.text = character.name
        descriptionLabel.text = character.description
        if let thumb = character.thumbnail {
            characterImageView.imageURL = thumb
        }
        accessibilityLabel = "\(character.id) \(character.name)"
    }

}
