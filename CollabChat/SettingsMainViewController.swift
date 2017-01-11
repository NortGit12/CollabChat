//
//  SettingsMainViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/10/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class SettingsMainViewController: UIViewController {
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func themeSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        if let newTheme = Theme(rawValue: sender.selectedSegmentIndex) {
            ThemeManager.setTheme(newTheme)
            
            // Configure Navigation Bar's bar style
            self.navigationController?.navigationBar.barStyle = newTheme.barStyle
            
            // Configure the Tab Bar's bar style
            self.tabBarController?.tabBar.barStyle = newTheme.barStyle
        }
    }

    //==================================================
    // MARK: - View Lifecycle
    //==================================================
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ThemeManager.applyTheme(toView: self.view)
    }

}
