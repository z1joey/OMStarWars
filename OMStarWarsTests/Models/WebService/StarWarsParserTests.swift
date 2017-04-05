//  Copyright © 2017 Outware Mobile. All rights reserved.

class OMStarWarsParserTests: XCTestCase {
    
    let starWarsParser: StarWarsParser = StarWarsParser()
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseResponse() {
        let json = starWarsParser.parseResponse(fromObject: OMStarWarsParserTests.ResponseData)
        expect(json).toNot(beNil())
        expect(json?.array) != nil
        expect(json?.array).to(haveCount(0))
    }
    
    func testParseFilms() {
        let json = JSON(OMStarWarsParserTests.FilmsData)
        let films = starWarsParser.parseFilms(fromJSONObject: json)
        expect(films).to(haveCount(2))
    }
    
    func testParseFilm() {
        let filmData = OMStarWarsParserTests.FilmsData.first!
        let json = JSON(filmData)
        let film = starWarsParser.parseFilm(fromJSONObject: json)
        expect(film.title) == filmData["title"] as? String
        expect(film.episodeID) == filmData["episode_id"] as? Int
        expect(film.openingCrawl) == filmData["opening_crawl"] as? String
        expect(film.producer) == filmData["producer"] as? String
        expect(film.director) == filmData["director"] as? String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        expect(film.releaseDate) == dateFormatter.date(from: filmData["release_date"] as! String)
    }
    
    static let ResponseData = [
        "count": 7,
        "next": "null",
        "previous": "null",
        "results": []
    ] as [String : Any]
    
    static let FilmsData =
    [[
        "title": "A New Hope",
        "episode_id": 4,
        "opening_crawl": "Introduction 4",
        "director": "George Lucas",
        "producer": "Gary Kurtz, Rick McCallum",
        "release_date": "1977-05-25",
        "characters": [
        "http://swapi.co/api/people/1/",
        "http://swapi.co/api/people/2/",
        "http://swapi.co/api/people/3/",
        "http://swapi.co/api/people/4/",
        "http://swapi.co/api/people/5/",
        "http://swapi.co/api/people/6/",
        "http://swapi.co/api/people/7/",
        "http://swapi.co/api/people/8/",
        "http://swapi.co/api/people/9/",
        "http://swapi.co/api/people/10/",
        "http://swapi.co/api/people/12/",
        "http://swapi.co/api/people/13/",
        "http://swapi.co/api/people/14/",
        "http://swapi.co/api/people/15/",
        "http://swapi.co/api/people/16/",
        "http://swapi.co/api/people/18/",
        "http://swapi.co/api/people/19/",
        "http://swapi.co/api/people/81/"
        ],
        "planets": [
        "http://swapi.co/api/planets/2/",
        "http://swapi.co/api/planets/3/",
        "http://swapi.co/api/planets/1/"
        ],
        "starships": [
        "http://swapi.co/api/starships/2/",
        "http://swapi.co/api/starships/3/",
        "http://swapi.co/api/starships/5/",
        "http://swapi.co/api/starships/9/",
        "http://swapi.co/api/starships/10/",
        "http://swapi.co/api/starships/11/",
        "http://swapi.co/api/starships/12/",
        "http://swapi.co/api/starships/13/"
        ],
        "vehicles": [
        "http://swapi.co/api/vehicles/4/",
        "http://swapi.co/api/vehicles/6/",
        "http://swapi.co/api/vehicles/7/",
        "http://swapi.co/api/vehicles/8/"
        ],
        "species": [
        "http://swapi.co/api/species/5/",
        "http://swapi.co/api/species/3/",
        "http://swapi.co/api/species/2/",
        "http://swapi.co/api/species/1/",
        "http://swapi.co/api/species/4/"
        ],
        "created": "2014-12-10T14:23:31.880000Z",
        "edited": "2015-04-11T09:46:52.774897Z",
        "url": "http://swapi.co/api/films/1/"
    ],
    [
        "title": "Attack of the Clones",
        "episode_id": 2,
        "opening_crawl": "Introduction 2",
        "director": "George Lucas",
        "producer": "Rick McCallum",
        "release_date": "2002-05-16",
        "characters": [
        "http://swapi.co/api/people/2/",
        "http://swapi.co/api/people/3/",
        "http://swapi.co/api/people/6/",
        "http://swapi.co/api/people/7/",
        "http://swapi.co/api/people/10/",
        "http://swapi.co/api/people/11/",
        "http://swapi.co/api/people/20/",
        "http://swapi.co/api/people/21/",
        "http://swapi.co/api/people/22/",
        "http://swapi.co/api/people/33/",
        "http://swapi.co/api/people/36/",
        "http://swapi.co/api/people/40/",
        "http://swapi.co/api/people/43/",
        "http://swapi.co/api/people/46/",
        "http://swapi.co/api/people/51/",
        "http://swapi.co/api/people/52/",
        "http://swapi.co/api/people/53/",
        "http://swapi.co/api/people/58/",
        "http://swapi.co/api/people/59/",
        "http://swapi.co/api/people/60/",
        "http://swapi.co/api/people/61/",
        "http://swapi.co/api/people/62/",
        "http://swapi.co/api/people/63/",
        "http://swapi.co/api/people/64/",
        "http://swapi.co/api/people/65/",
        "http://swapi.co/api/people/66/",
        "http://swapi.co/api/people/67/",
        "http://swapi.co/api/people/68/",
        "http://swapi.co/api/people/69/",
        "http://swapi.co/api/people/70/",
        "http://swapi.co/api/people/71/",
        "http://swapi.co/api/people/72/",
        "http://swapi.co/api/people/73/",
        "http://swapi.co/api/people/74/",
        "http://swapi.co/api/people/75/",
        "http://swapi.co/api/people/76/",
        "http://swapi.co/api/people/77/",
        "http://swapi.co/api/people/78/",
        "http://swapi.co/api/people/82/",
        "http://swapi.co/api/people/35/"
        ],
        "planets": [
        "http://swapi.co/api/planets/8/",
        "http://swapi.co/api/planets/9/",
        "http://swapi.co/api/planets/10/",
        "http://swapi.co/api/planets/11/",
        "http://swapi.co/api/planets/1/"
        ],
        "starships": [
        "http://swapi.co/api/starships/21/",
        "http://swapi.co/api/starships/39/",
        "http://swapi.co/api/starships/43/",
        "http://swapi.co/api/starships/47/",
        "http://swapi.co/api/starships/48/",
        "http://swapi.co/api/starships/49/",
        "http://swapi.co/api/starships/32/",
        "http://swapi.co/api/starships/52/",
        "http://swapi.co/api/starships/58/"
        ],
        "vehicles": [
        "http://swapi.co/api/vehicles/4/",
        "http://swapi.co/api/vehicles/44/",
        "http://swapi.co/api/vehicles/45/",
        "http://swapi.co/api/vehicles/46/",
        "http://swapi.co/api/vehicles/50/",
        "http://swapi.co/api/vehicles/51/",
        "http://swapi.co/api/vehicles/53/",
        "http://swapi.co/api/vehicles/54/",
        "http://swapi.co/api/vehicles/55/",
        "http://swapi.co/api/vehicles/56/",
        "http://swapi.co/api/vehicles/57/"
        ],
        "species": [
        "http://swapi.co/api/species/32/",
        "http://swapi.co/api/species/33/",
        "http://swapi.co/api/species/2/",
        "http://swapi.co/api/species/35/",
        "http://swapi.co/api/species/6/",
        "http://swapi.co/api/species/1/",
        "http://swapi.co/api/species/12/",
        "http://swapi.co/api/species/34/",
        "http://swapi.co/api/species/13/",
        "http://swapi.co/api/species/15/",
        "http://swapi.co/api/species/28/",
        "http://swapi.co/api/species/29/",
        "http://swapi.co/api/species/30/",
        "http://swapi.co/api/species/31/"
        ],
        "created": "2014-12-20T10:57:57.886000Z",
        "edited": "2015-04-11T09:45:01.623982Z",
        "url": "http://swapi.co/api/films/5/"
    ]]
    
}

import Nimble
import XCTest
import SwiftyJSON
@testable import OMStarWars
