//
//  CoreDeclarations.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation


/// Core declaration for the minimum contract of a MoviesService.
protocol CoreMoviesService {
	associatedtype Paths
	associatedtype TopChartCompletion
	
	/// Type that will refer to the available paths the MoviesService could use.
	var paths: Paths { get }
	
	
	/// Unique path available at the moment. Getting the top chart movies list.
	///
	/// - Parameter completion: Completion to return the result from the top chart movies request.
	func getTopMovies(with completion: TopChartCompletion)
}
