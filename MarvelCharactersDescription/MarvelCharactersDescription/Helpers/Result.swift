//
//  Result.swift
//  MarvelCharactersDescription
//
//  Created by Ade Adegoke on 20/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import Foundation

enum Result<DataType, ErrorType: Error> {
    case success(DataType)
    case failure(ErrorType)
}

