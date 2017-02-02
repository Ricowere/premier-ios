//
//  UI.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import UIKit


/**
*  This protocol represent the abstraction for an UI element that
*  is presenter dependent.
*/
protocol UI: class {
	func set(title: String?)
}

/**
*  ListUI declaration represents a view with the ability to display a list.
*/
protocol ListUI: UI {
	associatedtype RowItem
	
	var sections: [ListSection<RowItem>] { get set }
	
	/// Show the elements in the view provided from the presenter
	///
	/// - Parameter sections: Sections conforming the list.
	func show(with sections: [ListSection<RowItem>])
	
	
	/// Add the elements in the view provided from the presenter.
	///
	/// - Parameters:
	///   - row: Row to be added.
	///   - section: Section in which it was added
	func add(_ row: RowItem, to section: ListSection<RowItem>)
	
	
	/// Reload the list in case the presenter requires it.
	func reload()
}

protocol ListItemUI: UI {
	associatedtype Item
	
	func set(with item: Item)
}

/**
*  ListSection represent a presentation model to display a section in a list.
*/
class ListSection<RowItem> {
	let title: String?
	var rows: [RowItem]
	let footer: String?
	
	init(title: String? = nil, rows: [RowItem], footer: String? = nil) {
		self.title = title
		self.rows = rows
		self.footer = footer
	}
}
