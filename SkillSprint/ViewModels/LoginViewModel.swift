//
//  LoginViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 26/03/2024.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    
    // UI
    @Published var emailFieldValue: String = ""
    @Published var passwordFieldValue: String = ""
    
    // navigation
    @Published var presentingSignUpView: Bool = false
    
    // error handling
    @Published var isShowingError: Bool = false
    @Published var errorMessage: String = ""
    
    func login() {
        if(!emailFieldValue.isEmpty && !passwordFieldValue.isEmpty) {
            FireBaseManager.shared.loginInUser(emailValue: emailFieldValue, passwordValue: passwordFieldValue) { result in
                if(!result) {
                    self.showError("Wrong email or password")
                }
            }
        } else {
            self.showError("Fields should not be empty")
        }
    }
    
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
