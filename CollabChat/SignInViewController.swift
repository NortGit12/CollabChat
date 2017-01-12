//
//  SignInViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/22/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Firebase
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
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, email.characters.count > 0 else {
            ErrorController.presentErrorAlertController(withTitle: "Email Details"
                , andMessage: "Provide an email address in order to receive a password reset email."
                , inViewController: self)
            return
        }
        
        FIRAuth.auth()?.sendPasswordReset(withEmail: email, completion: { (error) in
            if let error = error {
                NSLog(error.localizedDescription)
                ErrorController.presentErrorAlertController(withTitle: ""
                    , andMessage: error.localizedDescription
                    , inViewController: self)
                return
            }
            
            let successAlertController = UIAlertController(title: nil, message: "Password reset e-mail sent.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            successAlertController.addAction(okAction)
            self.present(successAlertController, animated: true, completion: nil)
        })
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        if let email = emailTextField.text
            , let password = passwordTextField.text {
            
            if email.characters.count == 0
                || password.characters.count == 0 {
                
                ErrorController.presentErrorAlertController(withTitle: "Missing Required Details"
                    , andMessage: "Both fields must have a value."
                    , inViewController: self)
            }
            
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if let error = error {
                    NSLog(error.localizedDescription)
                    ErrorController.presentErrorAlertController(withTitle: ""
                        , andMessage: error.localizedDescription
                        , inViewController: self)
                    return
                }
                
                self.performSegue(withIdentifier: "SignInToTabBarController", sender: nil)
            })
        }
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
}



















