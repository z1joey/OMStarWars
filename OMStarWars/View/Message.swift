//  Copyright © 2017 Outware Mobile. All rights reserved.

/**
 * Add additional support for the message.
 */
extension UIViewController {
    
    static let LocalizationMessage = "Messages"
    static let Error = "Error"
    static let Ok = "Ok"
    
    /**
     * Show an error message.
     */
    func showError(error: Error) {
        let title = NSLocalizedString(UIViewController.Error, tableName: UIViewController.LocalizationMessage, comment: "")
        let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
        let actionTitle = NSLocalizedString(UIViewController.Ok, tableName: UIViewController.LocalizationMessage, comment: "")
        let action = UIAlertAction(title: actionTitle, style: .default) { _ in }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
}

import UIKit
