//
//  SignInViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/22/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: "SignInToTabBarController", sender: nil)
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    private func setupViewElements() {
        
        emailTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
        signInButton.layer.cornerRadius = 20
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewElements()
        ThemeManager.applyTheme(toView: self.view)
    }
    
    //==================================================
    // MARK: - Navigation
    //================================================== 

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SignInToTabBarController" {
//            if let tabBarController = segue.destination as? UITabBarController
//                , let navCont = tabBarController.viewControllers?.first
//                , let conversationMainViewController = {
//                
//                
//                ThemeManager.tabBarController = conversationMainViewController.tabBarController
//                ThemeManager.applyTheme(toView: conversationMainViewController.view)
//            }
//        }
    }
    
}



















