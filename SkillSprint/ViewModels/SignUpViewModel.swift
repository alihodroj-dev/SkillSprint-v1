//
//  SignUpViewModel.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 26/03/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var nameFieldValue: String = ""
    @Published var emailFieldValue: String = ""
    @Published var passwordFieldValue: String = ""
    @Published var confirmPasswordFieldValue: String = ""
    
}
