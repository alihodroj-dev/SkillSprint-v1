//
//  HomeView.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 01/04/2024.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    // UI
    @State var tabBarSelection: TabBarSelection = .home
    
    // navigation
    @Binding var isLoggedIn: Bool

    
    var body: some View {
        VStack {
            Button("logout") {
                FireBaseManager.shared.logoutUser()
                withAnimation(.bouncy) {
                    isLoggedIn = false
                }
            }
            Spacer()
            TabBarView(tabBarSelection: $tabBarSelection)
        }
    }
}

#Preview {
    HomeView(isLoggedIn: .constant(false))
}


// tab bar
struct TabBarView: View {
    
    // view properties
    @Binding var tabBarSelection: TabBarSelection
    
    var body: some View {
        HStack {
            ForEach(TabBarSelection.allCases, id: \.rawValue) { tab in
                VStack(spacing: 5) {
                    // icon image
                    Image(tab == tabBarSelection ? tab.rawValue.lowercased() + "_selected" : tab.rawValue.lowercased() + "_unselected")
                        .resizable()
                        .frame(width: 25, height: 25)
                    // icon name
                    Text(tab.rawValue)
                        .font(.caption)
                        .bold(tab == tabBarSelection)
                        .foregroundStyle(tab == tabBarSelection ? .accent : .primary)
                }
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation {
                        tabBarSelection = tab
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60, alignment: .bottom)
        .overlay(alignment: .top) {
            Rectangle()
                .frame(height: 0.25)
                .foregroundStyle(.gray)
        }
    }
}
