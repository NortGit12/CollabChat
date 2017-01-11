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
        
        // Configure the tint color
        UIApplication.shared.delegate?.window??.tintColor = theme.tintColor
        
        // Configure the navigation bar's bar style
        UINavigationBar.appearance().barStyle = theme.barStyle
        
        let titleDictionary: [String: Any] = [NSForegroundColorAttributeName: theme.tintColor]
        UINavigationBar.appearance().titleTextAttributes = titleDictionary
        
        // Configure the Tab Bar
        if let tabBarController = tabBarController {
            print("\ntheme.barStyle = \(theme.barStyle)\n")
            tabBarController.tabBar.barStyle = theme.barStyle
        }
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
        
        if let theme = ThemeManager.getTheme() {
            // Configure the view's background color
            view.backgroundColor = theme.backgroundColor
            
            if let tabBarController = ThemeManager.tabBarController {
                // Configure the Tab Bar's bar style
                tabBarController.tabBar.barStyle = theme.barStyle
                
                // Configure the Tab Bar icons
                guard let conversationsTabBarItem = tabBarController.tabBar.items?[0]
                    , let usersTabBarItem = tabBarController.tabBar.items?[1]
                    , let settingsTabBarItem = tabBarController.tabBar.items?[2] else {
                        NSLog("Error accessing all tab bar items.")
                        return
                }
                
                switch theme {
                case .dark:
                    // Customize the Tab Bar Item images
                    conversationsTabBarItem.selectedImage = UIImage(named: "tab-icon_convs_selected_41w")//?.renderingMode(.alwaysOriginal)
                    conversationsTabBarItem.image = UIImage(named: "tab-icon_convs_unselected_41w")//?.renderingMode(.alwaysOriginal)
                    usersTabBarItem.selectedImage = UIImage(named: "tab-icon_users_selected-black_31w")//?.renderingMode(.alwaysOriginal)
                    usersTabBarItem.image = UIImage(named: "tab-icon_users_unselected-black_31w")//?.renderingMode(.alwaysOriginal)
                    settingsTabBarItem.selectedImage = UIImage(named: "tab-icon_settings_selected-black_35w")//?.renderingMode(.alwaysOriginal)
                    settingsTabBarItem.image = UIImage(named: "tab-icon_settings_unselected_35w")//?.renderingMode(.alwaysOriginal)
                case .light:
                    // Customize the Tab Bar Item images
                    conversationsTabBarItem.selectedImage = UIImage(named: "tab-icon_convs_selected_41w")//?.renderingMode(.alwaysOriginal)
                    conversationsTabBarItem.image = UIImage(named: "tab-icon_convs_unselected_41w")//?.renderingMode(.alwaysOriginal)
                    usersTabBarItem.selectedImage = UIImage(named: "tab-icon_users_selected-white_31w")//?.renderingMode(.alwaysOriginal)
                    usersTabBarItem.image = UIImage(named: "tab-icon_users_unselected-white_31w")//?.renderingMode(.alwaysOriginal)
                    settingsTabBarItem.selectedImage = UIImage(named: "tab-icon_settings_selected-white_35w")//?.renderingMode(.alwaysOriginal)
                    settingsTabBarItem.image = UIImage(named: "tab-icon_settings_unselected_35w")//?.renderingMode(.alwaysOriginal)
                }
            }
        }
    }
}






















