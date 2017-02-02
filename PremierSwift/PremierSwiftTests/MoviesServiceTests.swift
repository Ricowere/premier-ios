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
	
	func testGetMoviesService_returnSuccessAccordingly() {
		let service = MoviesService(paths: SuccessPaths())
		let successCompletion = expectation(description: "Completion success")
		service.getTopMovies() { (error, movies) in
			XCTAssertTrue(error == nil)
			
			successCompletion.fulfill()
		}
		
		waitForExpectations(timeout: 1, handler: nil)
	}
	
	func testGetMoviesService_returnErrorOnMalformedPaths() {
		let service = MoviesService(paths: MalformedPaths())
		let errorCompletion = expectation(description: "Completion error")
		
		service.getTopMovies() { (error, movies) in
			XCTAssertFalse(error == nil)
			
			errorCompletion.fulfill()
		}
		
		waitForExpectations(timeout: 1, handler: nil)
	}
}

// MARK: Mock Paths

struct SuccessPaths: PathBuilder {
	func url(for path: MoviesPaths) -> URL {
		switch path {
		case .topChart: return Bundle(for: MoviesServiceTests.self).url(forResource: "movies.json", withExtension: nil)!
		}
	}
}

struct MalformedPaths: PathBuilder {
	func url(for path: MoviesPaths) -> URL {
		switch path {
		case .topChart: return Bundle(for: MoviesServiceTests.self).url(forResource: "moviesMalformed.json", withExtension: nil)!
		}
	}
}
