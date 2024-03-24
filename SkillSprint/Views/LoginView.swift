//
//  LoginView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 24/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack(spacing: 40) {
            
            // MARK: heading image
            Image("People_Thinking")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 280)
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
            
            // MARK: email & password fields
            VStack(spacing: 20) {
                // email
                HStack(spacing: 15) {
                    Image(systemName: "at")
                        .foregroundStyle(.gray)
                        .font(.title2)
                    TextField("", text: $email)
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
                    TextField("", text: $password)
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
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 25)
            
            Spacer()
            
            // MARK: login and signup buttons
            VStack(spacing: 5) {
                Button {
                    
                } label: {
                    Text("Login")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background { Color.accentColor.clipShape(RoundedRectangle(cornerRadius: 12)) }
                }
                
                HStack {
                    Color.black.clipShape(RoundedRectangle(cornerRadius: 22))
                        .frame(height: 1)
                    Text("OR")
                        .font(.caption)
                        .fontWeight(.light)
                    Color.black.clipShape(RoundedRectangle(cornerRadius: 22))
                        .frame(height: 1)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                
                Button {
                    // todo
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background { Color.accentColor.clipShape(RoundedRectangle(cornerRadius: 12)) }
                }
                
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 25)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.vertical)
    }
}

#Preview {
    LoginView()
}
