//
//  MarvelCharectersViewModelTests.swift
//  MarvelCharactersDescriptionTests
//
//  Created by Ade Adegoke on 14/06/2018.
//  Copyright © 2018 AKA. All rights reserved.
//

import XCTest
@testable import MarvelCharactersDescription

class MarvelCharectersViewModelTests: XCTestCase {
    var dataSource: MockCharactersDataSource!
    var delegate: SpyMarvelCharectersViewModelDelegate!
    var viewModel: MarvelCharectersViewModel!
    
    override func setUp() {
        super.setUp()
        dataSource = MockCharactersDataSource()
        delegate = SpyMarvelCharectersViewModelDelegate()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        dataSource = nil
        delegate = nil
        viewModel = nil
    }
    
    func test_fetchCharacters_withDataError() {
        //setup of your test
        viewModel = MarvelCharectersViewModel(dataSource: dataSource)
        viewModel.delegate = delegate
        
        dataSource.shouldReturnError = true
        
        //execution
        viewModel.fetchCharacters()
        
        //validation
        XCTAssertTrue(delegate.wasModelDidUpdateWithError)
        XCTAssertFalse(delegate.wasModelDidUpdateData)
    }
    
    func test_fetchCharacters_withNoDataError() {
        viewModel = MarvelCharectersViewModel(dataSource: dataSource)
        viewModel.delegate = delegate
        
        //execution
        viewModel.fetchCharacters()
        
        //validation
        XCTAssertFalse(delegate.wasModelDidUpdateWithError)
        XCTAssertTrue(delegate.wasModelDidUpdateData)        
    }
    
    class SpyMarvelCharectersViewModelDelegate: MarvelCharectersViewModelDelegate {
        var wasModelDidUpdateData = false
        var wasModelDidUpdateWithError = false
        
        func modelDidUpdateData() {
            wasModelDidUpdateData = true
        }
        
        func modelDidUpdateWithError(error: Error) {
            wasModelDidUpdateWithError = true
        }
    }
    
    class MockCharactersDataSource: CharactersDataSource {
        var shouldReturnError = false
        
        func fetchCharacters(completion: @escaping CharactersDataSourceCompletionHandler) {
            if shouldReturnError {
                completion(.failure(CharactersDataSourceError.fatal("Mock error")))
            } else {
                completion(.success([]))
            }
        }
        
        
    }
}



