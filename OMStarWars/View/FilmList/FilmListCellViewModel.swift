//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The cell view for a film cell.
 */
class FilmListCellViewModel {
    
    let title: String
    
    init(withFilm film: Film) {
        title = film.title
    }
    
}

import Foundation
