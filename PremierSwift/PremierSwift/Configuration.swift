//
//  Configuration.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/// Minimum unit to represent a Configuration API file.
struct Configuration {
	let imagesMetadata: [AnyHashable : Any]
}

extension Configuration {
	
	/// Failable convenience init to initialize a Configuration typically from a JSON representation.
	init?(json: [AnyHashable: Any]) {
		self.imagesMetadata = json
	}
}
