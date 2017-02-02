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
	let imageLogo: URL?
}

extension Movie {
	
	/// Failable convenience init to initialize a Movie typically from a JSON representation.
	init?(json: [AnyHashable: Any]) {
		guard let name = json["title"] as? String,
			let content = json["overview"] as? String else {
				return nil
		}
		
		self.title = name
		self.overview = content
		
		self.imageLogo = nil
	}
}
