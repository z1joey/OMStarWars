//  Copyright © 2017 Outware Mobile. All rights reserved.


class StarWarsServiceTests: XCTestCase {
    
    let service = StarWarsService()
        
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGetFilms() {
        var retrievedFilms: Array<Film>? = []
        var retrievedError: Error? = nil
        service.getFilms { (films, error) in
            retrievedFilms = films
            retrievedError = error
        }
        expect(retrievedFilms).toEventuallyNot(beNil(), timeout: 5)
        expect(retrievedFilms).toEventuallyNot(haveCount(0), timeout: 5)
        expect(retrievedError).toEventually(beNil(), timeout: 5)
    }
        
}
import XCTest
import Nimble
@testable import OMStarWars
