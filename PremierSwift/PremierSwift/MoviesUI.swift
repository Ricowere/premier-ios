//
//  MoviesUI.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/// Minimum contract to be implemented for any view that wants to represent the movies view.
protocol MoviesUI: ListUI {
	
	/// Called when the view has to display a loading state or not.
	///
	/// - Parameter loading: loading or not
	func set(loading: Bool)
}

/// Presentation model that represent the minimum unit of a Movie.
struct MoviePresentation {
	var identifier: String {
		return "MovieViewCell"
	}
	
	let title: String
	let overview: String
	let imageLogo: URL
}
