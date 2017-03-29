//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * Parse the data returned by the server.
 */
class StarWarsParser {
    /**
     * Parse a list of films.
     */
    func parseFilms(object: Any) -> Array<Film>? {
        let json = JSON(object)
        let filmObjects = json["results"]
        if !filmObjects.exists() {
            return nil
        }
        return filmObjects.arrayValue.map({ filmObject in
            parseFilm(jsonObject: filmObject)
        })
    }
    
    /**
     * Parse a film.
     */
    func parseFilm(jsonObject: JSON) -> Film {
        let film = Film()
        film.title = jsonObject["title"].stringValue
        film.episodeId = jsonObject["episode_id"].intValue
        film.openingCrawl = jsonObject["opening_crawl"].stringValue
        film.director = jsonObject["director"].stringValue
        film.producer = jsonObject["producer"].stringValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: jsonObject["release_date"].stringValue)
        if date != nil {
            film.releaseDate = date!
        }
        return film
    }
}

import Foundation
import SwiftyJSON
