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

    override func viewDidLoad() {
        super.viewDidLoad()

        ThemeManager.applyTheme(toView: self.view)
    }
}
