//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmListViewModel {
    
    private let service: StarWarsService
    private var films: Array<Film>
//    let filmAmount: Property
    
    init() {
        films = []
        service = StarWarsService()
//        filmAmount = Property(films.count)
    }
    
    func getFilms(showLoadingEffect: @escaping (Bool) -> Void, showError: @escaping(AnyError) -> Void) {
        let producer = createGetFilmsProducer(showLoadingEffect: showLoadingEffect, showError: showError)
        producer.start()
    }
    
    private func createGetFilmsProducer(showLoadingEffect: @escaping (Bool) -> Void, showError: @escaping (AnyError) -> Void) -> SignalProducer<Array<Film>, AnyError> {
        let (signal, observer) = Signal<Array<Film>, AnyError>.pipe()
        let producer = SignalProducer<Array<Film>, AnyError>(signal).on(starting: {
            showLoadingEffect(true)
        }, started: nil, event: nil, failed: { (error) in
            showError(error)
            showLoadingEffect(false)
        }, completed: {
            showLoadingEffect(false)
        }, interrupted: nil, terminated: nil, disposed: nil) { (films) in
            self.films = films
        }
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
