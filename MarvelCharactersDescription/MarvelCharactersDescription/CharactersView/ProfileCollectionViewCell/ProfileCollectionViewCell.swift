//
//  ProfileCollectionViewCell.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 07/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
        
    //MARK: Properties
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet weak var charcterDescription: UITextView!
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCells(with characterProfile: Character) {
        characterNameLabel.text = characterProfile.name
        charcterDescription.text = characterProfile.description
        let imageFileExtension = characterProfile.thumbnail.`extension`
        let imagePath = characterProfile.thumbnail.path
        let imageURL = imagePath + "." + imageFileExtension
        characterImageView.downloadImage(from: imageURL)
    }
}
