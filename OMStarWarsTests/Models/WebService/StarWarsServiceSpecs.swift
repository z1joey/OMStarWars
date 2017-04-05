//  Copyright © 2017 Outware Mobile. All rights reserved.


class StarWarsServiceSpecs: QuickSpec {
    
    override func spec() {
        describe("Web service") {
            let webService = StarWarsService()
            
            describe("get films is called") {
                var retrievedFilms: Array<Film>? = []
                var retrievedError: Error? = nil
                webService.getFilms { (films, error) in
                    retrievedFilms = films
                    retrievedError = error
                }
                
                it("with several films") {
                    expect(retrievedFilms?.count).toEventually(beGreaterThan(0), timeout: 5)
                }
                
                it("without any error") {
                    expect(retrievedError).toEventually(beNil(), timeout: 5)
                }
            }
        }
    }
        
}
import Quick
import Nimble
@testable import OMStarWars
