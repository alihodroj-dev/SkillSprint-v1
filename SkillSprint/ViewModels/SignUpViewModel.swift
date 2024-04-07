//
//  SignUpViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 26/03/2024.
//

import Foundation
import SwiftUI

class SignUpViewModel: ObservableObject {
    
    // UI
    @Published var nameFieldValue: String = ""
    @Published var emailFieldValue: String = ""
    @Published var passwordFieldValue: String = ""
    @Published var confirmPasswordFieldValue: String = ""
    
    // error handling
    @Published var isShowingError: Bool = false
    @Published var errorMessage: String = ""
    
    // signup function
    func signup(loginViewModel: LoginViewModel) {
        if(!nameFieldValue.isEmpty && !emailFieldValue.isEmpty && !passwordFieldValue.isEmpty && !confirmPasswordFieldValue.isEmpty) {
            FireBaseManager.shared.signUpUser(emailValue: emailFieldValue, passwordValue: passwordFieldValue) { result in
                if(result) {
                    loginViewModel.presentingSignUpView = false
                } else {
                    self.showError("Error creating account")
                }
            }
        } else {
            self.showError("Fields should not be empty")
        }
    }
    
    // helper
    private func showError(_ message: String) {
        self.errorMessage = message
        withAnimation(.spring) {
            self.isShowingError.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.spring) {
                self.isShowingError.toggle()
            }
        }
    }
    
}
