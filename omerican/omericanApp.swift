//
//  omericanApp.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import SwiftUI
import Firebase

@main
struct omericanApp: App {
    
//@StateObject var dataManager = DataManager()
    init(){
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
             
        }
    }
}
