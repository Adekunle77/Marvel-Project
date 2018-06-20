//
//  JsonData.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 10/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation
typealias CharactersDataSourceCompletionHandler = (_ result: Result<[Character], CharactersDataSourceError> ) -> Void

enum CharactersDataSourceError: Error {
    case fatal(String)
    case network(Error)
    case dataError(Error)
    case jsonParseError(Error)
}

protocol CharactersDataSource {
    func fetchCharacters(completion: @escaping CharactersDataSourceCompletionHandler)
}

class MarvelCharactersDataSource: CharactersDataSource {
    
    static let shared = MarvelCharactersDataSource()
    
    func fetchCharacters(completion: @escaping CharactersDataSourceCompletionHandler ) {
        guard let path = Bundle.main.path(forResource: "MarvelCharactersResponse", ofType: "json") else {
            completion(Result.failure(CharactersDataSourceError.fatal("Path not found")))
            return
        }
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let dataFromJson = try JSONDecoder().decode(ResponseData.self, from: data)
            let charatersJSONInformation = dataFromJson.data.results
            
            completion(Result.success(charatersJSONInformation))
        } catch {
            completion(Result.failure(CharactersDataSourceError.dataError(error)))
        }
    }    

}


