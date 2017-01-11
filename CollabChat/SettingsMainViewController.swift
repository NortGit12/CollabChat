//
//  SettingsMainViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/10/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit
import Firebase

class SettingsMainViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
//    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var darkThemeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var lightThemeButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var profileLabel: UILabel!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var themeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var usernameTextField: UITextField!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func signOutButtonTapped(_ sender: UIButton) {
        do {
            try FIRAuth.auth()?.signOut()
            
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let signInViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
            present(signInViewController, animated: true, completion: nil)
        } catch let error as NSError {
            NSLog(error.localizedDescription)
            ErrorController.presentErrorAlertController(withTitle: ""
                , andMessage: error.localizedDescription
                , inViewController: self)
            return
        }
    }
    
    @IBAction func themeButtonTapped(_ sender: UIButton) {
        print("\nsender.tag = \(sender.tag)")
        if let newTheme = Theme(rawValue: sender.tag) {
            ThemeManager.setTheme(newTheme)
            
            setLabelTintColorsForTheme(newTheme)
            
            // Configure Navigation Bar's bar style
            self.navigationController?.navigationBar.barStyle = newTheme.barStyle
            
            switch newTheme {
            case .dark:
                setBackgroundImage("theme-image_dark_selected_40w", onButton: darkThemeButton)
                setBackgroundImage("theme-image_light_unselected_50w", onButton: lightThemeButton)
            case .light:
                setBackgroundImage("theme-image_dark_unselected_40w", onButton: darkThemeButton)
                setBackgroundImage("theme-image_light_selected_50w", onButton: lightThemeButton)
            }
            
            ThemeManager.applyTheme(toView: self.view)
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func setupViewElements() {
        // Round text field corners
//        confirmPasswordTextField.layer.cornerRadius = 20
        emailTextField.layer.cornerRadius = 20
        firstNameTextField.layer.cornerRadius = 20
        lastNameTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
        signOutButton.layer.cornerRadius = 20
        usernameTextField.layer.cornerRadius = 20
        
        // Assign theme-specific theme images
        guard let theme = ThemeManager.getTheme() else {
            NSLog("Error accessing the current theme.")
            return
        }
        
        setLabelTintColorsForTheme(theme)
        
        switch theme {
        case .dark:
            setBackgroundImage("theme-image_dark_selected_40w", onButton: darkThemeButton)
            setBackgroundImage("theme-image_light_unselected_50w", onButton: lightThemeButton)
        case .light:
            setBackgroundImage("theme-image_dark_unselected_40w", onButton: darkThemeButton)
            setBackgroundImage("theme-image_light_selected_50w", onButton: lightThemeButton)
        }
        
    }
    
    private func setBackgroundImage(_ imageName: String, onButton button: UIButton) {
        button.setBackgroundImage(UIImage(named: imageName)?
                .withRenderingMode(.alwaysOriginal)
//                .resizableImage(withCapInsets: UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0))
            , for: .normal)
    }
    
    private func setLabelTintColorsForTheme(_ theme: Theme) {
        switch theme {
        case .dark, .light:
            profileLabel.textColor = theme.tintColor
            themeLabel.textColor = theme.tintColor
        }
    }

    //==================================================
    // MARK: - View Lifecycle
    //==================================================
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ThemeManager.applyTheme(toView: self.view)
    }

}
