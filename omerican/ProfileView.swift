//
//  ProfileView.swift
//  omerican
//
//  Created by Rita Marrano on 26/01/23.
//

import SwiftUI
import Firebase
import FirebaseAuth
import UIKit

struct ProfileView: View {
    
    @State var shouldShowLogOutOptions = false
    @Binding var isUserCurrentlyLoggedOut : Bool
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: 50){
            
//            Spacer()
            Circle()
                    .frame(width: 150, height: 150)
            
            
            
//            Spacer()
            
            Button {
                //logout
                shouldShowLogOutOptions.toggle()
            } label: {
                Text("Log out")
                    .bold()
                    .frame(width: 200, height: 40)
                    .background(            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.linearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)))
                    .foregroundColor(.white)
            }
            .padding()
            .actionSheet(isPresented: $shouldShowLogOutOptions) {
                .init(title: Text("Settings"), message: Text("What do you want to do?"), buttons: [
                    .destructive(Text("Sign Out"), action: {
                        print("handle sign out")
                        try? Auth.auth().signOut()
                        self.isUserCurrentlyLoggedOut = false
                    }),
                    .cancel()
                ])
            }
        }
        }//Z

}
    

}

struct ProfileView_Previews: PreviewProvider {
    @State static var isUserCurrentlyLoggedOut = false
    
    static var previews: some View {
        ProfileView( isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut )
    }
}
