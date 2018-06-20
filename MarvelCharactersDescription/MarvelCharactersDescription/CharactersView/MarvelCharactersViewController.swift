//
//  ViewController.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 07/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import UIKit

class MarvelCharactersViewController: UIViewController {
    
// MARK: Properties
    @IBOutlet private weak var profileCollectionView: UICollectionView!
    fileprivate let reuseIdentifier = "cell"
    
    private var viewModel: MarvelCharectersViewModel!
    
// MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataSource = MarvelCharactersDataSource()
        
        viewModel = MarvelCharectersViewModel(dataSource: dataSource)
        viewModel.delegate = self
        
        let nib =  UINib(nibName: "ProfileCollectionViewCell", bundle: nil)
        profileCollectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        
        viewModel.fetchCharacters()
    }
    
}

extension MarvelCharactersViewController: MarvelCharectersViewModelDelegate {
    func modelDidUpdateData() {
        self.profileCollectionView.reloadData()
    }
    
    func modelDidUpdateWithError(error: Error) {
        print(error)
    }
}

// MARK: Extension
extension MarvelCharactersViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProfileCollectionViewCell
        let characterProfile = viewModel.characters[indexPath.item]
        cell.updateCells(with: characterProfile)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.size.width
        let height = view.bounds.size.height
        
        return CGSize(width: width - 30, height: height - 550)
    }
}
