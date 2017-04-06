//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmDetailViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Film detail view model") {
            let film = createFilm()
            let viewModel = FilmDetailViewModel(withFilm: film)
            
            describe("is created") {
                it("with title") {
                    expect(viewModel.title) == "Film 1 (2000)"
                }
                
                it("with episode id") {
                    expect(viewModel.episodeID) == "1"
                }
                
                it("with opening crawl") {
                    expect(viewModel.openingCrawl) == "Description 1"
                }
                
                it("with director") {
                    expect(viewModel.director) == "Director 1"
                }
                
                it("with producer") {
                    expect(viewModel.producer) == "Producer 1"
                }
            }
        }
    }
    
    func createFilm() -> Film {
        let film = Film()
        film.title = "Film 1"
        film.episodeID = 1
        film.openingCrawl = "Description 1"
        film.director = "Director 1"
        film.producer = "Producer 1"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        film.releaseDate = dateFormatter.date(from: "2000-01-01")!
        return film
    }
    
}

import Nimble
import Quick
@testable import OMStarWars

