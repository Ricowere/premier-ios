//
//  MovieViewCell.swift
//  PremierSwift
//
//  Created by David rico on 02/02/2017.
//  Copyright © 2017 Deliveroo. All rights reserved.
//

import UIKit

final class MoviewViewCell: UITableViewCell, ListItemUI {
	@IBOutlet weak var movieTitleLabel: UILabel?
	@IBOutlet weak var movieOverviewLabel: UILabel?
	@IBOutlet weak var movieImageLogo: UIImageView?
}

extension MoviewViewCell {
	
	func set(title: String?) {}
	
	func set(with movie: MoviePresentation) {
		movieTitleLabel?.attributedText = NSAttributedString(string: movie.title,
		                                                     attributes: NSAttributedString.titleAttributes)
		movieOverviewLabel?.attributedText = NSAttributedString(string: movie.overview,
		                                                        attributes: NSAttributedString.bodyAttributes)
		
		let dispatchImageWork = DispatchWorkItem {
			do {
				let data = try Data(contentsOf: movie.imageLogo)
				
				OperationQueue.main.addOperation { [weak self] in
					self?.movieImageLogo?.image = UIImage(data: data)
				}
			}
			catch {}
		}
		
		DispatchQueue.global().async(execute: dispatchImageWork)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		movieImageLogo?.image = nil
	}
}
