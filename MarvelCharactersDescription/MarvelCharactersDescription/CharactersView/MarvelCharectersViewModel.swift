//
//  MarvelCharectersViewPresenter.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 12/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

protocol MarvelCharectersViewModelDelegate: class {
    func modelDidUpdateData()
    func modelDidUpdateWithError(error: Error)
}

class MarvelCharectersViewModel {    
    var characters = [Character]()
    
    weak var delegate: MarvelCharectersViewModelDelegate?
    
    let dataSource: CharactersDataSource

    init(dataSource: CharactersDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchCharacters() {
        dataSource.fetchCharacters { [weak self] (result) in
            //Run on the main thread !!!
            switch result {
            case .failure(let error):
                self?.delegate?.modelDidUpdateWithError(error: error)
                return
            case .success(let characters):
                self?.characters = characters
                self?.delegate?.modelDidUpdateData()
            }
//            if case .failure(let error) = result {
//                self?.delegate?.modelDidUpdateWithError(error: error)
//                return
//            }
//
//            guard let characters = characters else {
//                assertionFailure("No error but we have no data also! Something is wrong!")
//                return
//            }
//
//            self?.characters = characters
//            //self?.delegate?.modelDidUpdateData()
        }
    }

}
