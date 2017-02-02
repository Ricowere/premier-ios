//
//  PathBuilder.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/// PathBuilder contract to be implemement for any type that wants to build paths.
protocol PathBuilder {
	associatedtype PathDeclarations
	
	/// Returns a path based on the path declaration provided by parameter.
	///
	/// - Parameter path: Desired path to build
	/// - Returns: URL with the full path built
	func url(for path: PathDeclarations) -> URL
}
