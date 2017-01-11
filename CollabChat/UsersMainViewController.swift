//
//  UsersMainViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/10/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class UsersMainViewController: UIViewController {

    //==================================================
    // MARK: - View Lifecycle
    //==================================================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ThemeManager.applyTheme(toView: self.view)
    }

}
