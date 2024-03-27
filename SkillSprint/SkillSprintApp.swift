//
//  SkillSprintApp.swift
//  SkillSprint
//
//  Created by Ali Hodroj on 24/03/2024.
//

import SwiftUI
import FirebaseCore

@main
struct SkillSprintApp: App {
    
    init() {
        // configuring firebase
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
