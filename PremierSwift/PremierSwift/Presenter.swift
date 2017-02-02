//
//  Presenter.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import Foundation

/**
*  Presenter protocol declaration that represents
*  the most basic abstraction of a presenter.
*/
protocol Presenter: class {
	associatedtype View : UI
	
	weak var ui: View? { get }
	
	/**
	Use this method to attach a view with the presenter
	- parameter view: Pass a View type representing the view to be handled
	*/
	func attachView(_ view: View)
	
	/**
	This method will detach the view from the presenter and this won't be know
	anymore about that view.
	*/
	func detachView()
}

protocol ListPresenter: Presenter {
	associatedtype RowItem
	
	/// Number of sections to be holded by the presenter.
	var sections: [ListSection<RowItem>] { get }
}
