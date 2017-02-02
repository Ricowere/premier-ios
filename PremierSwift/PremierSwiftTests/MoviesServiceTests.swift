//
//  MoviesServiceTests.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import XCTest

@testable import PremierSwift

class MoviesServiceTests: XCTestCase {
	
	var successService: MoviesService<SuccessPaths>!
	var errorService: MoviesService<MalformedPaths>!
	
	override func setUp() {
		super.setUp()
		
		successService = MoviesService(paths: SuccessPaths())
		errorService = MoviesService(paths: MalformedPaths())
	}
	
	func testGetMoviesService_returnSuccessAccordingly() {
		let successCompletion = expectation(description: "Completion success")
		successService.getTopMovies() { (error, movies) in
			XCTAssertTrue(error == nil)
			
			successCompletion.fulfill()
		}
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	func testGetMoviesService_returnErrorOnMalformedPaths() {
		let errorCompletion = expectation(description: "Completion error")
		
		errorService.getTopMovies() { (error, movies) in
			XCTAssertFalse(error == nil)
			
			errorCompletion.fulfill()
		}
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	
	func testGetConfiguration_loadProperlyAConfigurationFile() {
		let successCompletion = expectation(description: "Completion success")
		successService.loadConfiguration() { (error, configuration) in
			XCTAssertTrue(error == nil)
			
			successCompletion.fulfill()
		}
		
		waitForExpectations(timeout: 1, handler: nil)
		
		XCTAssertNotNil(successService.configuration)
	}
}

// MARK: Mock Paths

struct SuccessPaths: PathBuilder {
	func url(for path: MoviesPaths) -> URL {
		switch path {
		case .topChart: return Bundle(for: MoviesServiceTests.self).url(forResource: "movies.json", withExtension: nil)!
		case .configuration: return Bundle(for: MoviesServiceTests.self).url(forResource: "configuration.json", withExtension: nil)!
		}
	}
}

struct MalformedPaths: PathBuilder {
	func url(for path: MoviesPaths) -> URL {
		switch path {
		case .topChart: return Bundle(for: MoviesServiceTests.self).url(forResource: "moviesMalformed.json", withExtension: nil)!
		case .configuration: return Bundle(for: MoviesServiceTests.self).url(forResource: "moviesMalformed.json", withExtension: nil)!
		}
	}
}
