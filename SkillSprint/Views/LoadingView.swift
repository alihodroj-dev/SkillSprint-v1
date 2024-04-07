//
//  LoadingView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 01/04/2024.
//

import SwiftUI
import FirebaseAuth

struct LoadingView: View {
    
    // animation states
    @State private var backgroundColorFadeFactor: Double = 1.0
    @State private var logoFadeFactor: Double = 1.0
    @State private var logoScaleFactor: Double = 1.0
    @State private var logoRotationFactor: Angle = .degrees(0)
    
    // navigation
    @State private var isLoggedIn: Bool = Auth.auth().currentUser != nil
    
    var body: some View {
        // main container
        ZStack {
            HomeView(isLoggedIn: $isLoggedIn)
                .opacity(isLoggedIn ? 1 : 0)
                .preferredColorScheme(.light)
            LoginView(isLoggedIn: $isLoggedIn)
                .offset(x: isLoggedIn ? UIScreen.main.bounds.width : 0)
                .opacity(isLoggedIn ? 0 : 1)
                .preferredColorScheme(.light)
            // background color
            Color.accent.ignoresSafeArea()
                .opacity(self.backgroundColorFadeFactor)
            // logo image
            Image("SkillSprintLogo")
                .resizable()
                .frame(width: 200, height: 200)
                .scaleEffect(self.logoScaleFactor)
                .opacity(self.logoFadeFactor)
                .rotationEffect(self.logoRotationFactor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            // spin animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(duration: 0.5).delay(0).repeatCount(3, autoreverses: true)) {
                    self.logoRotationFactor = .degrees(180)
                }
            }
            // scale animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.75) {
                withAnimation(.spring(duration: 0.5)) {
                    self.logoScaleFactor = 0.8
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.spring) {
                        self.logoScaleFactor = 30
                        self.logoFadeFactor = 0
                        self.backgroundColorFadeFactor = 0
                    }
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}
