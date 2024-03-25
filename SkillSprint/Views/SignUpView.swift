//
//  SignUpView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 25/03/2024.
//

import SwiftUI

struct SignUpView: View {
    
    // viewModel
    @ObservedObject private var vm: SignUpViewModel = SignUpViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            
            // MARK: heading image
            Image("group_on_table")
                .resizable()
                .frame(width: UIScreen.main.bounds.width - 120)
                .frame(height: UIScreen.main.bounds.width - 160)
                .padding(.horizontal, 40)
            
            // MARK: heading text
            VStack(alignment: .leading, spacing: 5) {
                Text("Sign Up")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                Text("Create your account")
                    .font(.subheadline)
                    .foregroundStyle(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
            
            // MARK: name & email & password fields
            VStack(spacing: 20) {
                // name
                HStack(spacing: 15) {
                    Image(systemName: "person")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    TextField("", text: $vm.nameFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Name")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.gray)
                                Color.gray
                                    .frame(height: 1)
                            }
                        }
                }
                // email
                HStack(spacing: 15) {
                    Image(systemName: "at")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    TextField("", text: $vm.emailFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Email")
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
                    TextField("", text: $vm.passwordFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Password")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.gray)
                                Color.gray
                                    .frame(height: 1)
                            }
                        }
                }
                // confirm password
                HStack(spacing: 15) {
                    Image(systemName: "checkmark")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    TextField("", text: $vm.confirmPasswordFieldValue)
                        .frame(maxWidth: .infinity)
                        .frame(height: 35)
                        .background {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Confirm Password")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .foregroundStyle(.gray)
                                Color.gray
                                    .frame(height: 1)
                            }
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
            
            Spacer()
            
            // MARK: create button
            Button {
                
            } label: {
                Text("Create")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .frame(height: 40)
                    .foregroundStyle(.white)
                    .background { Color.accentColor.clipShape(RoundedRectangle(cornerRadius: 12)) }
                    .padding(.horizontal, 25)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background { Color.white.ignoresSafeArea() }
        .padding(.vertical)
    }
}

#Preview {
    SignUpView()
}
