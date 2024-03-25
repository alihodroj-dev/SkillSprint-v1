//
//  LoginViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 26/03/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var emailFieldValue: String = ""
    @Published var passwordFieldValue: String = ""
    @Published var presentingSignUpView: Bool = false
    
}
