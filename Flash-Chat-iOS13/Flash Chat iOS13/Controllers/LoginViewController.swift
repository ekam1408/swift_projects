//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    var loginUserManager = HandleUserManager();
    override func viewDidLoad() {
        super.viewDidLoad();
        loginUserManager.delegate = self;
    }
    @IBAction func loginPressed(_ sender: UIButton) {
        loginUserManager.loginUser(with: emailTextfield.text ?? "", password: passwordTextfield.text ?? "");
    }
}

//MARK: - HandleUserManagerDelegate

extension LoginViewController: HandleUserDelegate {
    func didHandleUserWithSuccess() {
        performSegue(withIdentifier: K.loginSegue, sender: self);
    }
    
    func didHandleUserWithError(_ err: Error) {
        print(err);
    }
}
