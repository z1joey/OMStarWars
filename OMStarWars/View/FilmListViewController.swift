//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The list used to display a list of films.
 */
class FilmListViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = FilmListViewModel()
        viewModel.getFilms(showLoadingEffect: { (isLoading) in
            
        }) { (error) in
            self.showError(error: error)
        }
    }


}

import UIKit

