//
//  ConversationMainViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/10/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class ConversationMainViewController: UIViewController {
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /*
         Set the Tab Bar Controller, so all subsequent calls to applyTheme(toView:)
         will update the Tab Bar
        */
        ThemeManager.tabBarController = self.tabBarController
        ThemeManager.applyTheme(toView: self.view)
    }
}
