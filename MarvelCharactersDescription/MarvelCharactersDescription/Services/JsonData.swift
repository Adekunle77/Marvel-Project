//
//  JsonData.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 10/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

class JsonData {
    
    var charactersInformantion: [JsonModel] = []
    
    private func charactersInfoFromJson() {
        guard let path = Bundle.main.path(forResource: "MarvelCharactersResponse", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            print(data, "£80 million")
            let dataFromJson = try JSONDecoder().decode(ResponseData.self, from: data)
            let charatersJSONInformation = dataFromJson.data.results
            charactersInformantion = charatersJSONInformation
        } catch {
            
        }
    }
}
