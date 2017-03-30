//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The information about a film.
 */
class Film {
    
    var title: String
    var episodeId: Int
    var openingCrawl: String
    var director: String
    var producer: String
    var releaseDate: Date
    
    init() {
        title = ""
        episodeId = 0
        openingCrawl = ""
        director = ""
        producer = ""
        releaseDate = Date()
    }
    
}

import Foundation

