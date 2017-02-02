//
//  MoviesPathBuilder.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation


/// Paths metadata for the Movies.
///
/// - get: Get top movies list
enum MoviesPaths {
	case topChart
	case configuration
}

/// Specialisation of PathBuilder to build Movies paths.
struct MoviesPathsBuilder: PathBuilder {
	
	/// Returns a path based on the path declaration provided by parameter.
	///
	/// - Parameter path: Desired path to build
	/// - Returns: URL with the full path built
	func url(for path: MoviesPaths) -> URL {
		switch path {
		case .topChart: return URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")!
		case .configuration: return URL(string: "https://api.themoviedb.org/3/configuration?api_key=e4f9e61f6ffd66639d33d3dde7e3159b")!
		}
	}
}
