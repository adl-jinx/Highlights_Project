//
//  ContentView.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import SwiftUI
import CoreData
import Firebase

struct ContentView: View {
    
    @StateObject var favorites = Favorites()
    @State private var isUserCurrentlyLoggedOut: Bool = true //qua
    
    var body: some View {
        NavigationView{
            if self.isUserCurrentlyLoggedOut{
            TabView {
                
                
                
                
                
                ListView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem(){
                        Image(systemName: "figure.soccer")
                        Text("A")
                    }
                
                ListView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem(){
                        Image(systemName: "star.fill")
                        Text("Faved")
                    }
                
                PlayersSearchView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem(){
                        Image(systemName: "figure.soccer")
                        Text("B")
                    }
                
                ProfileView( isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem(){
                        Image(systemName: "person.fill")
                        Text("C")
                    }
            }
        } else {
            content
        }
    }
    
}
    
 
    var content: some View{
        LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



extension View {
    
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment){
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}


