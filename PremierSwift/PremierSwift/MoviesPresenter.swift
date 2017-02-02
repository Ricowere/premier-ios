//
//  MoviesPresenter.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

final class MoviesPresenter<View: MoviesUI>: ListPresenter, MoviesDependencies where View.RowItem == MoviePresentation {
	weak var ui: View? = nil
	
	var sections = [ListSection<MoviePresentation>]()
	
	//MARK: Presenter declarations
	
	func attachView(_ view: View) {
		ui = view
		
		ui?.set(title: "Top Movies")
		
		ui?.set(loading: true)
		getTopMovies()
	}
	
	func detachView() {
		ui = nil
	}
}

// MARK: Business logic

extension MoviesPresenter {
	
	/// Method for loading the top movies
	func getTopMovies() {
		
		moviesService.getTopMovies { [weak self] (error, movies) in
			guard let movies = movies, error == nil else {
				return
			}
			
			let rows = movies.map {
				return MoviePresentation(title: $0.title,
				                         overview: $0.overview,
				                         imageLogo: $0.images.url(for: .list($0.backdropImagePath)))
			}
			let section = ListSection(rows: rows)
			self?.sections = [section]
			
			OperationQueue.main.addOperation { [weak self] in
				self?.ui?.show(with: [section])
				self?.ui?.set(loading: false)
			}
		}
	}
}
