//
//  FirebaseManager.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 27/03/2024.
//

import Foundation
import FirebaseAuth

class FireBaseManager {
    
    // singleton
    static let shared = FireBaseManager()
    
    // check if logged in
    func checkIfLoggedIn() -> Bool {
        if(Auth.auth().currentUser != nil) { return true } else { return false }
    }
    
    // sign in user
    func loginInUser(emailValue: String, passwordValue: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: emailValue, password: passwordValue) { result, err in
            if let _ = err { completion(false) } else { completion(true) }
        }
    }
    
    // create user
    func signUpUser(emailValue: String, passwordValue: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: emailValue, password: passwordValue) { result, err in
            if let _ = err { completion(false) } else { completion(true) }
        }
    }
    
    // logout user
    func logoutUser() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
