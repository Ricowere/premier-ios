//
//  MovieTests.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import XCTest

@testable import PremierSwift

class MovieTests: XCTestCase {
	
	func testMovie_isSuccessfullyCreatedFromJSON() {
		let json = ["title": "The Shawshank Redemption",
		            "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
		            "backdrop_path": "/xBKGJQsAIeweesB79KC89FpBrVr.jpg"]
		
		XCTAssertNotNil(Movie(json: json))
	}
	
	func testMovie_isSuccessfullyCreatedButSkippingInvalidImageURLSFromJSON() {
		let json = ["title": "The Shawshank Redemption",
		            "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope."]
		
		guard let movie = Movie(json: json) else { fatalError() }
		
		XCTAssertNil(movie.imageLogo)
	}
	
	func testMovie_failCreatingItFromJSON() {
		let json = ["title": "The Shawshank Redemption",
		            "backdrop_path": "/xBKGJQsAIeweesB79KC89FpBrVr.jpg"]
		
		XCTAssertNil(Movie(json: json))
	}
}
