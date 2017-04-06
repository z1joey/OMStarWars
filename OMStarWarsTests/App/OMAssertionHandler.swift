//  Copyright © 2017 Outware Mobile. All rights reserved.

class OMAssertionHandler : AssertionHandler {
    func assert(_ assertion: Bool, message: FailureMessage, location: SourceLocation) {
        if (!assertion) {
            print("Expectation failed: \(message.stringValue)")
        }
    }
}

import Foundation
import Nimble
