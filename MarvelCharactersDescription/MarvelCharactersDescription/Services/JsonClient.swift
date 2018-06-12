//
//  JsonData.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 10/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

class JsonClient {
    
    private var charactersInformantion: [JsonModel] = []
    
    func charactersProfilesFromJson() -> [JsonModel] {
        if charactersInformantion.isEmpty {
            charactersInformantion = charactersInfoFromJson()
        }
        return charactersInformantion
    }
    
     func charactersInfoFromJson() -> [JsonModel] {
        var charactersJsonData: [JsonModel] = []
        guard let path = Bundle.main.path(forResource: "MarvelCharactersResponse", ofType: "json") else { return charactersJsonData }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            print("£88 Million")
            let dataFromJson = try JSONDecoder().decode(ResponseData.self, from: data)
            let charatersJSONInformation = dataFromJson.data.results
            print(charatersJSONInformation, "£60 Million")
            charactersJsonData = charatersJSONInformation
        } catch {
            
        }
        print("£75 Million I will get")
        return charactersJsonData
    }
}
