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
    fileprivate var reuseIdentifier = "cell"

// MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

// MARK: Extension

extension MarvelCharactersView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}
