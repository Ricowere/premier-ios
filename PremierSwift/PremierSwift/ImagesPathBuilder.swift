//
//  ImagesPathBuilder.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/// Paths metadata for the Images.
///
/// - list: Get image URL suitable for list
enum ImagesPaths {
	case list(String)
}

/// Specialisation of ImagesBuilder to build Images paths.
struct ImagesPathsBuilder: PathBuilder {
	let configuration: Configuration
	
	/// Returns a path based on the path declaration provided by parameter.
	///
	/// - Parameter path: Desired path to build
	/// - Returns: URL with the full path built
	func url(for path: ImagesPaths) -> URL {
		switch path {
		case .list(let path):
			guard let basePath = configuration.imagesMetadata["secure_base_url"] as? String,
				let logoSizes = configuration.imagesMetadata["logo_sizes"] as? [String],
				let size = logoSizes.filter({ return $0 == "w92" }).first else {
					return URL(string: "http://simpleicon.com/wp-content/uploads/film.png")!
			}
			return URL(string: "\(basePath)/\(size)\(path)")!
		}
	}
}
