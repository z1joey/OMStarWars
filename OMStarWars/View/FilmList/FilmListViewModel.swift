//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * The view model used by the FilmListViewController.
 */
class FilmListViewModel {
    
    private let service: StarWarsService
    private var films: Array<Film>
    private var reloadSignal: (Signal<(), NoError>, Observer<(), NoError>)
    var filmAmount: Int {
        return films.count
    }
    var isReadyForReloading: Signal<(), NoError> {
        return reloadSignal.0
    }
    
    init() {
        service = StarWarsService()
        films = []
        reloadSignal = Signal<(), NoError>.pipe()
    }
    
    /**
     * Get the films from the web service.
     */
    func getFilms(withLoadingEffect showLoadingEffect: @escaping (Bool) -> Void, withError showError: @escaping (AnyError) -> Void) {
        let getFilmsProducer = createGetFilmsProducer().on(starting: {
            showLoadingEffect(true)
        }, failed: { (error) in
            showError(error)
            showLoadingEffect(false)
        }, completed: {
            showLoadingEffect(false)
        }) {
            films in
            self.films = films
            self.reloadSignal.1.send(value: ())
            self.reloadSignal.1.sendCompleted()
        }
        getFilmsProducer.start()
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
        let (signal, observer) = Signal<Array<Film>, AnyError>.pipe()
        let producer = SignalProducer<Array<Film>, AnyError>(signal)
        service.getFilms { (films, error) in
            if error != nil {
                observer.send(error: AnyError(error!))
            } else if films != nil {
                observer.send(value: films!)
            }
            observer.sendCompleted()
        }
        return producer
    }
    
}

import ReactiveCocoa
import ReactiveSwift
import Result
import Foundation
