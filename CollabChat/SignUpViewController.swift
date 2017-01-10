//
//  SignUpViewController.swift
//  CollabChat
//
//  Created by Jeff Norton on 12/22/16.
//  Copyright © 2016 JeffCryst. All rights reserved.
//

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
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
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
        ThemeManager.setBackgroundColor(forView: self.view)
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
