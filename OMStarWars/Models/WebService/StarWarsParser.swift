//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * Parse the data returned by the server.
 */
class StarWarsParser {
    
    /**
     * Get the results from the response.
     */
    func parseResponse(fromObject object: Any?) -> JSON? {
        if object == nil {
            return nil
        }
        let json = JSON(object!)
        let results = json["results"]
        if !results.exists() {
            return nil
        }
        return results
    }
    
    /**
     * Parse a list of films.
     */
    func parseFilms(fromJSONObject object: JSON) -> Array<Film> {
        return object.arrayValue.map({ filmObject in
            parseFilm(fromJSONObject: filmObject)
        })
    }
    
    /**
     * Parse a film.
     */
    func parseFilm(fromJSONObject object: JSON) -> Film {
        let film = Film()
        film.title = object["title"].stringValue
        film.episodeID = object["episode_id"].intValue
        film.openingCrawl = object["opening_crawl"].stringValue
        film.openingCrawl = film.openingCrawl.replacingOccurrences(of: "\r\n\r\n", with: "{NEWPARAGRAPH}")
        film.openingCrawl = film.openingCrawl.replacingOccurrences(of: "\r\n", with: "")
        film.openingCrawl = film.openingCrawl.replacingOccurrences(of: "{NEWPARAGRAPH}", with: "\r\n\r\n")
        film.director = object["director"].stringValue
        film.producer = object["producer"].stringValue
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let date = formatter.date(from: object["release_date"].stringValue)
        if date != nil {
            film.releaseDate = date!
        }
        return film
    }
    
}

import Foundation
import SwiftyJSON
