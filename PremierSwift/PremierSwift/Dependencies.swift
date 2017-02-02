//
//  Dependencies.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/// Dependency injection for Movies related stuffs.
protocol MoviesDependencies {
	associatedtype MService: CoreMoviesService
	var moviesService: MService { get }
}

/// MARK: Default dependencies

fileprivate let _moviesService = MoviesService(paths: MoviesPathsBuilder())


// MARK: - Default MoviesService dependencies

extension MoviesDependencies {
	var moviesService: MoviesService<MoviesPathsBuilder> {
		return _moviesService
	}
}
