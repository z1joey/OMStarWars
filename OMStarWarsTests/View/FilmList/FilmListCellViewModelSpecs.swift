//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmListCellViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Film list cell view model") {
            let film = createFilm()
            let viewModel = FilmListCellViewModel(withFilm: film)
            
            describe("is created") {
                it("with title") {
                    expect(viewModel.title) == "Film 1"
                }
                
                it("with episode id") {
                    expect(viewModel.episodeID) == "1"
                }
            }
        }
    }
    
    func createFilm() -> Film {
        let film = Film()
        film.title = "Film 1"
        film.episodeID = 1
        return film
    }
    
}

import Nimble
import Quick
@testable import OMStarWars
