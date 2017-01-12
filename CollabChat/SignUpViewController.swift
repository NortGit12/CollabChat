//
//  SignUpViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/22/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

import Firebase
import UIKit

class SignUpViewController: UIViewController {
    
    //==================================================
    // MARK: - _Properties
    //==================================================
    
    @IBOutlet weak var alreadyHaveAccountButton: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    
    //==================================================
    // MARK: - Actions
    //==================================================
    
    @IBAction func alreadyHaveAccountButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        if let confirmPassword = confirmPasswordTextField.text
            , let email = emailTextField.text
            , let firstName = firstNameTextField.text
            , let lastName = lastNameTextField.text
            , let password = passwordTextField.text
            , let username = usernameTextField.text {
            
            if confirmPassword.characters.count == 0
                || email.characters.count == 0
                || firstName.characters.count == 0
                || lastName.characters.count == 0
                || password.characters.count == 0
                || username.characters.count == 0 {
                
                ErrorController.presentErrorAlertController(withTitle: "Missing Required Details"
                    , andMessage: "All fields must have a value."
                    , inViewController: self)
            }
            
            if password != confirmPassword {
                ErrorController.presentErrorAlertController(withTitle: "Passwords Must Match"
                    , andMessage: "Password and Confirm password do not match.  Try again."
                    , inViewController: self)
            }
            
            // Create the user in Firebase
            FIRAuth.auth()!.createUser(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    NSLog(error.localizedDescription)
                    ErrorController.presentErrorAlertController(withTitle: ""
                        , andMessage: error.localizedDescription
                        , inViewController: self)
                    return
                }
                
                // Adding some extra profile detials
                let userProfileData = [
                    "email": email
                    , "firstName": firstName
                    , "lastName": lastName
                    , "username": username
                ]
                
                // Add user profile data
                if let user = user {
                    let usersRef = FIRDatabase.database().reference().child("users")
                    usersRef.child(user.uid).setValue(userProfileData)
                    
                    // Sign in
                    FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                        if let error = error {
                            NSLog(error.localizedDescription)
                            ErrorController.presentErrorAlertController(withTitle: ""
                                , andMessage: error.localizedDescription
                                , inViewController: self)
                            return
                        }
                        
                        self.resignFirstResponder()
                        self.performSegue(withIdentifier: "SignUpToTabBarController", sender: self)
                    })
                }
            }
        }
    }
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
//    private func presentErrorAlertController(withTitle title: String, andMessage message: String) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//    }
    
    private func setupViewElements() {
    
        alreadyHaveAccountButton.layer.cornerRadius = 20
        confirmPasswordTextField.layer.cornerRadius = 20
        emailTextField.layer.cornerRadius = 20
        firstNameTextField.layer.cornerRadius = 20
        lastNameTextField.layer.cornerRadius = 20
        passwordTextField.layer.cornerRadius = 20
        signUpButton.layer.cornerRadius = 20
        usernameTextField.layer.cornerRadius = 20
    }
    
    //==================================================
    // MARK: - View Lifecycle
    //==================================================

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewElements()
        ThemeManager.applyTheme(toView: self.view)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
