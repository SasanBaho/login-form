//
//  ViewController.swift
//  doTryCatch-practice
//
//  Created by Sasan Baho on 2021-03-31.
//

import UIKit

class ViewController: UIViewController {
    
    enum LoginError: Error {
        case incompleteForm
        case invalidEmail
        case incorrectPasswordLength
    }

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        do{
            try login()
        }catch LoginError.incompleteForm {
            Alert.showBasic(title: "Incomplete Form", message: "Fill form", vc: self)
        }catch LoginError.invalidEmail {
            Alert.showBasic(title: "Email is invalid", message: "Please put a valid email", vc: self)
        }catch LoginError.incorrectPasswordLength {
            Alert.showBasic(title: "Password Too Short", message: "Please make sure your password has more than 8 character", vc: self)
        }catch {
            Alert.showBasic(title: "Try Again", message: "There is a problem, please try again", vc: self)
        }
        
    }
    
    func login() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
    }
    
}

