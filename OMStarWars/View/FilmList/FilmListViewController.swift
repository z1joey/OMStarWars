//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The list used to display a list of films.
 */
class FilmListViewController: UIViewController {
    
    @IBOutlet weak var filmList: FilmList!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = true
        let viewModel = FilmListViewModel()
        filmList.viewModel = viewModel
        viewModel.getFilms() { (error) in
            self.showError(error: error)
        }
        loadingIndicator.reactive.isHidden <~ viewModel.isReloaded
        filmList.reactive.reloadData <~ viewModel.isReadyForReloading
//        filmList.reactive.trigger(for: #selector(tableView(_:))
    }


}

import UIKit
import ReactiveSwift
import ReactiveCocoa

