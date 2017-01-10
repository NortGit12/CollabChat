//
//  AppearanceController.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/23/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

let selectedThemeKey = "SelectedTheme"

enum Theme: Int {
    
    //==================================================
    // MARK: - Cases
    //==================================================
    
    case dark, light
    
    //==================================================
    // MARK: - Computed Properties
    //==================================================
    
    /* Consumers
     *UIApplication delegate window's tint color
     *UISwitch colors
     */
    var backgroundColor: UIColor {
        switch self {
        case .dark:
            return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0)     // black
        case .light:
            return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)  // white
        }
    }
    
    /* Consumers
     *UINavigation appearance's bar style
     */
    var barStyle: UIBarStyle {
        switch self {
        case .dark:
            return .black
        case .light:
            return .default
        }
    }
    
    var tintColor: UIColor {
        switch self {
        case .dark, .light:
            return UIColor(red: 255/255.0, green: 153/255.0, blue: 51/255.0, alpha: 1.0)  // orange
        }
    }
}

struct ThemeManager {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    static var tabBarController: UITabBarController?
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func setTheme(_ theme: Theme) {
        // Save the Theme value in UserDefaults and write the changes
        UserDefaults.standard.set(theme.rawValue, forKey: selectedThemeKey)
        UserDefaults.standard.synchronize()
        
        // Change the tint color
        UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        
        // Set the navigation bar's bar style
        UINavigationBar.appearance().barStyle = theme.barStyle
    }
    
    static func getTheme() -> Theme? {
        // Retrieve the theme value from UserDefaults.  If it succeeds create a new Theme instance.  If it doesn't then return the normal theme.
        if let storedTheme = (UserDefaults.standard.value(forKey: selectedThemeKey) as AnyObject).integerValue {
            guard let theme = Theme(rawValue: storedTheme) else {
                NSLog("Error creating theme instance from stored value.")
                return nil
            }
            return theme
        } else {
            return .dark
        }
    }
    
    static func applyTheme(toView view: UIView) {
        view.backgroundColor = ThemeManager.getTheme()?.backgroundColor
    }
}
