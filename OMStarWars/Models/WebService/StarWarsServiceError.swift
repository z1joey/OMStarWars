//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * Web service related errors.
 */
enum StarWarsServiceError: LocalizedError {
    case parser
    
    public var errorDescription: String? {
        return NSLocalizedString(StarWarsService.ServerError, tableName: StarWarsService.MessageLocalization, comment: "")
    }
}

import Foundation
