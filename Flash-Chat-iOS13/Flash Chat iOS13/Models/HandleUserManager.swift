//
//  UserManager.swift
//  Flash Chat iOS13
//
//  Created by Ekambeer Singh on 26/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol HandleUserDelegate {
    func didHandleUserWithSuccess();
    func didHandleUserWithError(_ err: Error);
}

struct HandleUserManager {
    var delegate: HandleUserDelegate?
    
    func registerUser(with email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            success, error in
            if let e = error {
                delegate?.didHandleUserWithError(e);
                return
            }
//            parseJSON(success);
            delegate?.didHandleUserWithSuccess();
        }
    }
    
    func loginUser(with email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            success, error in
            if let e = error {
                delegate?.didHandleUserWithError(e);
                return;
            }
            delegate?.didHandleUserWithSuccess();
        }
    }
    
    func logoutUser(){
        do {
            try Auth.auth().signOut();
            delegate?.didHandleUserWithSuccess();
        } catch let error as NSError {
            delegate?.didHandleUserWithError(error);
        }
    }
    
//    func parseJSON(_ success: RegisterUserModel) {
//
//    }
}
