//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    var registerUserManager = HandleUserManager();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        registerUserManager.delegate = self;
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        registerUserManager.registerUser(with: emailTextfield.text ?? "", password: passwordTextfield.text ?? "");
    }
}

//MARK: - RegisterUserManagerDelegate

extension RegisterViewController: HandleUserDelegate {
    func didHandleUserWithSuccess() {
        performSegue(withIdentifier: K.registerSegue, sender: self)
    }
    
    func didHandleUserWithError(_ err: Error) {
        print("err")
    }
}
