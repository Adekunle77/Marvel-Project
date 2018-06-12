//
//  MarvelCharectersViewPresenter.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 12/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

protocol MarvelCharactersViewProtocol {
    func getProfiles(fromJson: JsonClient)
}

class MarvelCharectersViewPresenter {
    
    
    var charactersProfiles = [JsonModel]()
    
    private func getProfiles(fromJson: JsonClient) {
        charactersProfiles = fromJson.charactersProfilesFromJson()
    }
}
