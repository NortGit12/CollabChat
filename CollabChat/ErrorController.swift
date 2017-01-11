//
//  ErrorController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/11/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class ErrorController {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func presentErrorAlertController(withTitle title: String, andMessage message: String, inViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }

}
