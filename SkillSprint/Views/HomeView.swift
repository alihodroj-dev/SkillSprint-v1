//
//  HomeView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 01/04/2024.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    // navigation
    @Binding var isLoggedIn: Bool

    
    var body: some View {
        Button("logout") {
            FireBaseManager.shared.logoutUser()
            withAnimation(.bouncy) {
                isLoggedIn = false
            }
        }
    }
}

#Preview {
    HomeView(isLoggedIn: .constant(false))
}
