//
//  Movie.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation


/// Minimum unit to represent a Movie.
struct Movie {
	let title : String
	let overview: String
	let backdropImagePath: String
	let images: ImagesPathsBuilder
}

extension Movie {
	
	/// Failable convenience init to initialize a Movie typically from a JSON representation.
	init?(json: [AnyHashable: Any], imagePaths: ImagesPathsBuilder) {
		guard let name = json["title"] as? String,
			let content = json["overview"] as? String,
			let backdropPath = json["poster_path"] as? String else {
				return nil
		}
		
		self.title = name
		self.overview = content
		self.images = imagePaths
		self.backdropImagePath = backdropPath
	}
}
