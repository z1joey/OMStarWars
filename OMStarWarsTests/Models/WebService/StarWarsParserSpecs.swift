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
                    expect(film.title) == "Film 1"
                }
                
                it("with episode id") {
                    expect(film.episodeID) == 1
                }
                
                it("with opening crawl") {
                    expect(film.openingCrawl) == "Description 1"
                }
                
                it("with producer") {
                    expect(film.producer) == "Producer 1"
                }
                
                it("with director") {
                    expect(film.director) == "Director 1"
                }
                
                it("with release date") {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    expect(film.releaseDate) == dateFormatter.date(from: "2000-01-01")
                }
            }
        }
    }
    
    static let FilmsData = [
        [
            "title": "Film 1",
            "episode_id": 1,
            "opening_crawl": "Description 1",
            "director": "Director 1",
            "producer": "Producer 1",
            "release_date": "2000-01-01",
            ],
        [
            "title": "Film 2",
            "episode_id": 2,
            "opening_crawl": "Description 2",
            "director": "Director 2",
            "producer": "Producer 2",
            "release_date": "2000-01-02"
        ]
    ]
    
    static let ResponseData = [
        "count": 2,
        "next": "null",
        "previous": "null",
        "results": StarWarsParserSpecs.FilmsData
        ] as [String : Any]
    
}

import Nimble
import Quick
import SwiftyJSON
@testable import OMStarWars
