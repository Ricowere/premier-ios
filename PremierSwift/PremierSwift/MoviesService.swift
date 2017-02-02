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
	
	var configuration: Configuration?
	
	/// Designated initializer.
	///
	/// - Parameter paths: Paths injected.
	init(paths: Paths) {
		self.paths = paths
	}
}

// MARK: Endpoints

extension MoviesService {
	
	/// Load the API configuration for getting the images metadata.
	///
	/// - Parameter completion: Completion to return the expected result.
	func loadConfiguration(with completion: @escaping (_ error: MoviesServiceError?, _ configuration: Configuration?) -> () ) {
	
		guard configuration == nil else {
			completion(nil, configuration!)
			return
		}
		
		let request = URLRequest(url: paths.url(for: .configuration))
		let task =
			urlSession.dataTask(with: request) { [weak self] (data, response, error) in
				guard error == nil else {
					completion(.invalidConfiguration, nil)
					return
				}
				
				guard let data = data,
					let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
					let images = json?["images"] as? [AnyHashable : Any],
					let configuration = Configuration(json: images) else {
						completion(.invalidTopMovies, nil)
						self?.configuration = nil
						return
				}
				
				self?.configuration = configuration
				
				completion(nil, configuration)
		}

		task.resume()
	}
	
	/// Getting the top chart movies list.
	///
	/// - Parameter completion: Completion to return the result from the top chart movies request.
	func getTopMovies(with completion: @escaping (_ error: MoviesServiceError?, _ movies: [Movie]?) -> ()) {
		
		loadConfiguration { (configError, configuration) in
			guard let configuration = configuration else {
				completion(.invalidTopMovies, nil)
				return
			}
			
			let request = URLRequest(url: self.paths.url(for: .topChart))
			let task =
				self.urlSession.dataTask(with: request) { (data, response, error) in
					guard error == nil else {
						completion(.invalidTopMovies, nil)
						return
					}
					
					guard let data = data,
						let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
						let movies = json?["results"] as? [[AnyHashable : Any]] else {
							completion(.invalidTopMovies, nil)
							return
					}

					completion(nil, movies.flatMap({ return Movie(json: $0, imagePaths: ImagesPathsBuilder(configuration: configuration)) }))
			}
			
			task.resume()
		}
	}
}

// MARK: Errors

/// Movies service errors.
///
/// - invalidTopMovies: Default error so far when something went wrong.
/// - invalidConfiguration: Default error for configuration
enum MoviesServiceError {
	case invalidTopMovies
	case invalidConfiguration
}
