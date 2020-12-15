//
//  JSON_Model.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 09/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

struct JsonModel: Codable {
    var name: String
    var description: String
    var path: String
    var imageExtension: String
}

struct ResponseData: Decodable {
    let data: CharactersData
}

struct CharactersData: Decodable {
    let results: [JsonModel]
}
