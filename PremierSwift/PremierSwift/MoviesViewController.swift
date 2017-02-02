import UIKit

class MoviesViewController: UIViewController, MoviesUI {
	@IBOutlet weak var tableView: UITableView?
	
	var sections: [ListSection<MoviePresentation>] = []
	var presenter = MoviesPresenter<MoviesViewController>()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView?.rowHeight = UITableViewAutomaticDimension
		tableView?.estimatedRowHeight = 80
		
		presenter.attachView(self)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let section = sections.first else { return 0 }
		
		return section.rows.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as? MoviewViewCell else {
			fatalError("You screwed up! Fix this! :)")
		}
		
		let movie = self.sections[indexPath.section].rows[indexPath.row]
		
		cell.set(with: movie)
		
		return cell
	}
}


// MARK: - MoviesUI

extension MoviesViewController {
	
	/// Show the elements in the view provided from the presenter
	///
	/// - Parameter sections: Sections conforming the list.
	func show(with sections: [ListSection<MoviePresentation>]) {
		self.sections = sections
		reload()
	}
	
	/// Add the elements in the view provided from the presenter.
	///
	/// - Parameters:
	///   - row: Row to be added.
	///   - section: Section in which it was added
	func add(_ row: MoviePresentation, to section: ListSection<MoviePresentation>) {}
	
	/// Reload the list in case the presenter requires it.
	func reload() { tableView?.reloadData() }
	
	/// Called when the view has to display a loading state or not.
	///
	/// - Parameter loading: loading or not
	func set(loading: Bool) {}
}


