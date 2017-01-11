//
//  User.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/11/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import Foundation

class User {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    var email: String
    var firstName: String
    var lastName: String
    var password: String
    var username: String
    
    //==================================================
    // MARK: - Initializers
    //==================================================
    
    init(email: String, firstName: String, lastName: String, password: String, username: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
        self.username = username
    }
}
