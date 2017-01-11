//
//  AppDelegate.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/22/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Firebase
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //==================================================
    // MARK: - Methods
    //==================================================

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        
        // Retrieve the stored theme property and apply it
        guard let storedTheme = ThemeManager.getTheme() else {
            NSLog("Error identifying the stored theme.")
            return false
        }
        
        let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil)
        if let launchScreenViewController = launchScreen.instantiateViewController(withIdentifier: "LaunchScreenViewController") as? LaunchScreenViewController {
            launchScreenViewController.view.backgroundColor = storedTheme.backgroundColor
        }
        
        ThemeManager.setTheme(storedTheme)
//        ThemeManager.setTheme(Theme(rawValue: 1)!)  // 0 = dark, 1 = light
        
        return true
    }
}
