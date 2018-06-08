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
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
