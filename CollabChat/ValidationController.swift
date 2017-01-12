//
//  ValidationController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/12/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class ValidationController {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func allItemsAreNonEmpty(inTextFieldsArray textFieldArray: [UITextField]) -> Bool {
        var result = true
        for item in textFieldArray {
            if item.text?.characters.count == 0 {
                result = false
                break
            }
        }
        
        return result
    }
}
