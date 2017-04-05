//  Copyright © 2017 Outware Mobile. All rights reserved.

class FilmsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConstructor() {
        let film = Film()
        expect(film.title) == ""
        expect(film.episodeID) == 0
        expect(film.openingCrawl) == ""
        expect(film.director) == ""
        expect(film.producer) == ""
        expect(film.releaseDate) != nil
    }
    
}

import Nimble
import XCTest
@testable import OMStarWars

