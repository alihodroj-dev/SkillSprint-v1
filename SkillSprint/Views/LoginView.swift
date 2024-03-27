//
//  LoginView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 24/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    // viewModel
    @ObservedObject private var vm: LoginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                // MARK: background color
                Color.white.ignoresSafeArea()
                
                // MARK: main container
                VStack(spacing: 40) {
                    
                    // MARK: heading image
                    Image("people_thinking")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .frame(height: UIScreen.main.bounds.width - 100)
                        .padding(.horizontal, 40)
                    
                    // MARK: heading text
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Login")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.black)
                        Text("Enter your email & password")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    
                    // MARK: email & password & error fields
                    VStack(spacing: 20) {
                        // email
                        HStack(spacing: 15) {
                            Image(systemName: "at")
                                .foregroundStyle(.gray)
                                .font(.title2)
                            TextField("", text: $vm.emailFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 35)
                                .foregroundStyle(.black)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .background {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(vm.emailFieldValue.isEmpty ? "Email" : "")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundStyle(.gray)
                                        Color.gray
                                            .frame(height: 1)
                                    }
                                }
                        }
                        // password
                        HStack(spacing: 15) {
                            Image(systemName: "lock")
                                .foregroundStyle(.gray)
                                .font(.title2)
                            SecureField("", text: $vm.passwordFieldValue)
                                .frame(maxWidth: .infinity)
                                .frame(height: 35)
                                .foregroundStyle(.black)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .background {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(vm.passwordFieldValue.isEmpty ? "Password" : "")
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundStyle(.gray)
                                        Color.gray
                                            .frame(height: 1)
                                    }
                                }
                        }
                        // error
                        Text(vm.errorMessage)
                            .font(.caption.bold())
                            .foregroundStyle(.red)
                            .opacity(vm.isShowingError ? 1 : 0)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 25)
                    
                    Spacer()
                    
                    // MARK: login and signup buttons
                    VStack(spacing: 2) {
                        // login
                        Button {
                            vm.login()
                        } label: {
                            Text("Login")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(height: 40)
                                .foregroundStyle(.white)
                                .background { Color.accent.clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        
                        HStack {
                            Color.black.clipShape(RoundedRectangle(cornerRadius: 22))
                                .frame(height: 1)
                            Text("OR")
                                .font(.caption)
                                .fontWeight(.light)
                                .foregroundStyle(.black)
                            Color.black.clipShape(RoundedRectangle(cornerRadius: 22))
                                .frame(height: 1)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 20)
                        // sign up
                        Button {
                            vm.presentingSignUpView.toggle()
                        } label: {
                            Text("Sign Up")
                                .bold()
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(height: 40)
                                .foregroundStyle(.white)
                                .background { Color.accent.clipShape(RoundedRectangle(cornerRadius: 12)) }
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 25)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.vertical, 25)
                .navigationDestination(isPresented: $vm.presentingSignUpView) { SignUpView() }
            }
        }
    }
}

#Preview {
    LoginView()
}
