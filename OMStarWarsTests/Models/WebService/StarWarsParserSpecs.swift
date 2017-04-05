//  Copyright © 2017 Outware Mobile. All rights reserved.

class StarWarsParserSpecs: QuickSpec {
    
    override func spec() {
        describe("Parser") {
            let starWarsParser: StarWarsParser = StarWarsParser()
            
            describe("parses response") {
                let results = starWarsParser.parseResponse(fromObject: StarWarsParserSpecs.ResponseData)
                
                it("with 2 results") {
                    expect(results?.array).to(haveCount(2))
                }
            }
            
            describe("parses films") {
                let json = JSON(StarWarsParserSpecs.FilmsData)
                let films = starWarsParser.parseFilms(fromJSONObject: json)
                
                it("with 2 films") {
                    expect(films).to(haveCount(2))
                }
            }
            
            describe("parses a film") {
                let data = StarWarsParserSpecs.FilmsData.first!
                let json = JSON(data)
                let film = starWarsParser.parseFilm(fromJSONObject: json)
                
                it("with title") {
                    expect(film.title) == data["title"] as? String
                }
                
                it("with episode id") {
                    expect(film.episodeID) == data["episode_id"] as? Int
                }
                
                it("with opening crawl") {
                    expect(film.openingCrawl) == data["opening_crawl"] as? String
                }
                
                it("with producer") {
                    expect(film.producer) == data["producer"] as? String
                }
                
                it("with director") {
                    expect(film.director) == data["director"] as? String
                }
                
                it("with release date") {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    expect(film.releaseDate) == dateFormatter.date(from: data["release_date"] as! String)
                }
            }
        }
    }
    
    static let FilmsData = [
        [
            "title": "A New Hope",
            "episode_id": 4,
            "opening_crawl": "Introduction 4",
            "director": "George Lucas",
            "producer": "Gary Kurtz, Rick McCallum",
            "release_date": "1977-05-25",
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
            "created": "2014-12-20T10:57:57.886000Z",
            "edited": "2015-04-11T09:45:01.623982Z",
            "url": "http://swapi.co/api/films/5/"
        ]
    ]
    
    static let ResponseData = [
        "count": 7,
        "next": "null",
        "previous": "null",
        "results": StarWarsParserSpecs.FilmsData
        ] as [String : Any]
    
}

import Nimble
import Quick
import SwiftyJSON
@testable import OMStarWars
