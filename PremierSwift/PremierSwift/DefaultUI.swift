//
//  DefaultUI.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import UIKit


// MARK: - Default implementation for setting a basic title in a navigation Item
extension UI where Self : UIViewController {
	func set(title: String?) {
		navigationItem.title = title
	}
}
