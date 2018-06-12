//
//  ViewController.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 07/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class MarvelCharactersView: UIViewController {
    
// MARK: Properties
    @IBOutlet private weak var profileCollectionView: UICollectionView!
    fileprivate let reuseIdentifier = "cell"
    
    private var presenter: MarvelCharectersViewPresenter!
    private var charactersProfiles = JsonClient()

// MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib =  UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        profileCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        print(charactersProfiles.charactersProfilesFromJson())
    }
    
}


// MARK: Extension
extension MarvelCharactersView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
//        let profiles = charactersProfiles
//        let characterProfile = profiles[indexPath.item]
//        cell.upDateCells(with: characterProfile)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        return CGSize(width: width - 20, height: height - 550)
    }
}
