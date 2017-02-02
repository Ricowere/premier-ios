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
	case list
}

/// Specialisation of ImagesBuilder to build Images paths.
struct ImagesPathsBuilder: PathBuilder {
	
	/// Returns a path based on the path declaration provided by parameter.
	///
	/// - Parameter path: Desired path to build
	/// - Returns: URL with the full path built
	func url(for path: ImagesPaths) -> URL {
		switch path {
		case .list: return URL(string: "http://www.google.com")!
		}
	}
}
