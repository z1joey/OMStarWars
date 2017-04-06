//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmsSpecs: QuickSpec {
    
    override func spec() {
        describe("A film") {
            let film = Film()
            
            describe("is created") {
                it("with title") {
                    expect(film.title) == ""
                }
                
                it("with episode id") {
                    expect(film.episodeID) == 0
                }
                
                it("with opening crawl") {
                    expect(film.openingCrawl) == ""
                }
                
                it("with director") {
                    expect(film.director) == ""
                }
                
                it("with producer") {
                    expect(film.producer) == ""
                }
                
                it("with release date") {
                    expect(film.releaseDate) != nil
                }
            }
        }
    }
    
}

import Nimble
import Quick
@testable import OMStarWars

