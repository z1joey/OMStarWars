//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The view model used by the FilmListViewController.
 */
class FilmListViewModel {
    
    private let service: StarWarsService
    private var films: Array<Film>
    private var getFilmsPipe: (Signal<Array<Film>, AnyError>, Observer<Array<Film>, AnyError>)
    var filmAmount: Int {
        return films.count
    }
    var isReadyForReloading: Signal<(), NoError> {
        return getFilmsPipe.0.map({ _ -> () in
            return ()
        }).flatMapError { error -> SignalProducer<(), NoError> in
            return SignalProducer<(), NoError>.empty
        }
    }
    var isReloaded: MutableProperty<Bool>
    
    init() {
        service = StarWarsService()
        films = []
        getFilmsPipe = Signal<Array<Film>, AnyError>.pipe()
        isReloaded = MutableProperty<Bool>(true)
    }
    
    /**
     * Get the films from the web service.
     */
    func getFilms(withError showError: @escaping (AnyError) -> Void) {
        let getFilmsSignalProducer = createGetFilmsProducer().on(starting: {
            self.isReloaded.value = false
        }, failed: { (error) in
            showError(error)
            self.isReloaded.value = true
        }, completed: {
            self.isReloaded.value = true
        }) {
            films in
            self.films = films
        }
        getFilmsSignalProducer.start()
    }
    
    /**
     * Get a sub view model.
     */
    func getFilmListCellViewModel(atIndex index: Int) -> FilmListCellViewModel {
        let film = films[index]
        return FilmListCellViewModel(withFilm: film)
    }
    
    /**
     * Create a signal producer.
     */
    private func createGetFilmsProducer() -> SignalProducer<Array<Film>, AnyError> {
        let producer = SignalProducer<Array<Film>, AnyError>(getFilmsPipe.0)
        service.getFilms { (films, error) in
            if error != nil {
                self.getFilmsPipe.1.send(error: AnyError(error!))
            } else if films != nil {
                self.getFilmsPipe.1.send(value: films!)
            }
            self.getFilmsPipe.1.sendCompleted()
        }
        return producer
    }
    
}

import ReactiveCocoa
import ReactiveSwift
import Result
import Foundation
