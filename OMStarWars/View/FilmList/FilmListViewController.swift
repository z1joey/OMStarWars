//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The list used to display a list of films.
 */
class FilmListViewController: UIViewController {
    
    static let FilmDetailViewController = "FilmDetailViewController"
    
    @IBOutlet weak var filmList: FilmList!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        filmList.showDetail = { filmDetailViewModel in
            let filmDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: FilmListViewController.FilmDetailViewController) as? FilmDetailViewController
            filmDetailViewController?.viewModel = filmDetailViewModel
            if filmDetailViewController != nil {
                self.navigationController?.pushViewController(filmDetailViewController!, animated: true)
            }
        }
        let viewModel = FilmListViewModel()
        filmList.viewModel = viewModel
        loadingIndicator.reactive.isHidden <~ viewModel.isReloaded
        filmList.reactive.reloadData <~ viewModel.isReadyForReloading
        viewModel.getFilms() { (error) in
            self.showError(error: error)
        }
    }
    
    
}

import UIKit
import ReactiveSwift
import ReactiveCocoa

