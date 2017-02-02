//
//  UIStoryboard+Creational.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import UIKit

// MARK: - Storyboard helper methods

extension UIStoryboard {
	
	func instantiateViewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
		
		return self.instantiateViewController(withIdentifier: String(describing: VC.self)) as! VC
	}
}
