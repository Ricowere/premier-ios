//
//  MoviesService.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

final class MoviesService<Paths: PathBuilder>: CoreMoviesService where Paths.PathDeclarations == MoviesPaths {
	var paths: Paths
	let urlSession: URLSession = URLSession(configuration: .default)
	
	/// Designated initializer.
	///
	/// - Parameter paths: Paths injected.
	init(paths: Paths) {
		self.paths = paths
	}
}

// MARK: Endpoints

extension MoviesService {
	
	/// Unique path available at the moment. Getting the top chart movies list.
	///
	/// - Parameter completion: Completion to return the result from the top chart movies request.
	func getTopMovies(with completion: @escaping (_ error: MoviesServiceError?, _ messages: [Movie]?) -> ()) {
		let request = URLRequest(url: paths.url(for: .topChart))
		let task =
			urlSession.dataTask(with: request) { (data, response, error) in
				guard error == nil else {
					completion(.invalidTopMovies, nil)
					return
				}
				
				guard let data = data,
					let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
					let messages = json?["results"] as? [[AnyHashable : Any]] else {
						completion(.invalidTopMovies, nil)
						return
				}
				
				completion(nil, messages.flatMap({ return Movie(json: $0) }))
		}
		
		task.resume()
	}
}

// MARK: Errors

/// Movies service errors.
///
/// - invalidTopMovies: Default error so far when something went wrong.
enum MoviesServiceError {
	case invalidTopMovies
}
