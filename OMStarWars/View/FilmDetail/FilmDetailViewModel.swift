//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The information shown on the detail page.
 */
class FilmDetailViewModel {
    
    var title: String
    var episodeID: String
    var openingCrawl: String
    var director: String
    var producer: String
    var releaseDate: String
    
    init(withFilm film: Film) {
        title = film.title
        episodeID = String(film.episodeID)
        openingCrawl = film.openingCrawl
        director = film.director
        producer = film.producer
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        releaseDate = dateFormatter.string(from: film.releaseDate)
    }
    
}

import Foundation
