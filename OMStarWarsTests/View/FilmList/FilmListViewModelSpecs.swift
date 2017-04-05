//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmListViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("Film list view model") {
            let viewModel = FilmListViewModel()
            
            describe("gets films") {
                
            }
            
            describe("get film list cell view model") {
                
            }
            
            describe("get film detail view model") {
                
            }
        }
    }
    
}

import Nimble
import Quick
@testable import OMStarWars






//    
//    /**
//     * Get the films from the web service.
//     */
//    func getFilms(withError showError: @escaping (AnyError) -> Void) {
//        let getFilmsSignalProducer = createGetFilmsProducer().on(starting: {
//            self.isReloaded.value = false
//        }, failed: { (error) in
//            showError(error)
//            self.isReloaded.value = true
//        }, completed: {
//            self.isReloaded.value = true
//        }) {
//            films in
//            self.films = films
//        }
//        getFilmsSignalProducer.start()
//    }
//    
//    /**
//     * Get a sub view model.
//     */
//    func getFilmListCellViewModel(atIndex index: Int) -> FilmListCellViewModel {
//        let film = films[index]
//        return FilmListCellViewModel(withFilm: film)
//    }
//    
//    /**
//     * Get a sub view model.
//     */
//    func getFilmDetailViewModel(atIndex index: Int) -> FilmDetailViewModel {
//        let film = films[index]
//        return FilmDetailViewModel(withFilm: film)
//    }
