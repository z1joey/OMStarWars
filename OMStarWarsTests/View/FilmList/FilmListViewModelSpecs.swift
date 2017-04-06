//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmListViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Film list view model") {
            var viewModel: FilmListViewModel!
            var retrievedError: AnyError?
            
            beforeEach {
                viewModel = FilmListViewModel()
                retrievedError = nil
                viewModel.getFilms() {
                    error in
                    retrievedError = error
                }
            }
            
            describe("gets films") {
                it("with no result at the beginning") {
                    expect(viewModel.filmAmount) == 0
                }
                
                it("with several results") {
                    expect(viewModel.filmAmount).toEventually(beGreaterThan(0), timeout: 5)
                }
                
                it("with no error") {
                    expect(retrievedError).toEventually(beNil(), timeout: 5)
                }
            }
            
            describe("get film list cell view model") {
                it("with no model at the begining") {
                    expect(viewModel.getFilmListCellViewModel(atIndex: 0)).to(beNil())
                }

                it("with correct title") {
                    expect(viewModel.getFilmListCellViewModel(atIndex: 0)?.title).toEventuallyNot(beEmpty(), timeout: 5)
                }

                it("with correct episode id") {
                    expect(viewModel.getFilmListCellViewModel(atIndex: 0)?.episodeID).toEventuallyNot(beEmpty(), timeout: 5)
                }
            }
            
            describe("get film detail view model") {
                it("with no model at the begining") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)).to(beNil())
                }
                
                it("with correct title") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)?.title).toEventuallyNot(beEmpty(), timeout: 5)
                }
                
                it("with correct episode id") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)?.episodeID).toEventuallyNot(beEmpty(), timeout: 5)
                }
                
                it("with correct opening crawl") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)?.openingCrawl).toEventuallyNot(beEmpty(), timeout: 5)
                }
                
                it("with correct director") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)?.director).toEventuallyNot(beEmpty(), timeout: 5)
                }
                
                it("with correct producer") {
                    expect(viewModel.getFilmDetailViewModel(atIndex: 0)?.producer).toEventuallyNot(beEmpty(), timeout: 5)
                }
            }
        }
    }
    
}

import Nimble
import Quick
import Result
@testable import OMStarWars
