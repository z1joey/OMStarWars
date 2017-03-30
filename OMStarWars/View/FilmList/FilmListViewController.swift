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
        filmList.reactive.reloadData <~ viewModel.isReadyForReloading
        viewModel.getFilms(withLoadingEffect: { (isLoading) in
            self.loadingIndicator.isHidden = !isLoading
        }) { (error) in
            self.showError(error: error)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.filmList.reloadData()
        }
    }


}

import UIKit
import ReactiveSwift
import ReactiveCocoa

