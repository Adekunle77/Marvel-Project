//
//  JSON_Model.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 09/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

struct Character: Decodable {
    var name: String
    var description: String
    var thumbnail: Thumbnail 
}

struct Thumbnail: Decodable {
    var `extension`:String
    var path: String
}

struct ResponseData: Decodable {
    var data: CharactersData
}

struct CharactersData: Decodable {
    var results: [Character]
}
