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
    
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var isUserCurrentlyLoggedOut: Bool = false
    
    var body: some View {
        NavigationView{
            if self.isUserCurrentlyLoggedOut{
            TabView {
                ListView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                    .tabItem(){
                        Image(systemName: "figure.soccer")
                        Text("A")
                    }
                
//                ProfileView( isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
//                    .tabItem(){
//                        Image(systemName: "figure.socialdance")
//                        Text("B")
//                    }
                
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
    
    
    
    
//    var content: some View{
//
//        ZStack{
//            Color.gray
//
//            RoundedRectangle(cornerRadius: 30, style: .continuous)
//                .foregroundStyle(.linearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing))
//                .frame(width: 1000, height: 400)
//                .rotationEffect(.degrees(135))
//                .offset(y: -370)
//
//            VStack(spacing: 20) {
//
//                Text("Welcome")
//                    .foregroundColor(.white)
//                    .font(.system(size: 49, weight: .bold, design: .rounded))
//                    .offset(x: -70, y:-100)
//
//                TextField("Email", text:  $email)
//                    .foregroundColor(.white)
//                    .textFieldStyle(.plain)
//                    .placeholder(when: email.isEmpty){
//                        Text("Email")
//                            .foregroundColor(.white)
//                            .bold()
//                    }
//
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//
//                SecureField("Password", text: $password)
//                    .foregroundColor(.white)
//                    .textFieldStyle(.plain)
//                    .placeholder(when: password.isEmpty){
//                        Text("Password")
//                            .foregroundColor(.white)
//                            .bold()
//
//                    }
//
//
//                Rectangle()
//                    .frame(width: 350, height: 1)
//                    .foregroundColor(.white)
//
//                Button{
//                    register()
//                } label: {
//                    Text("Sign up")
//                        .bold()
//                        .frame(width: 200, height: 40)
//                        .background(            RoundedRectangle(cornerRadius: 10, style: .continuous)
//                            .fill(.linearGradient(colors: [.pink, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)))
//                            .foregroundColor(.white)
//
//                }
//                .padding(.top)
//                .offset(y: 110)
//
//                Button{
//                    login()
//                } label: {
//                    Text("Already have an account? Login ")
//                        .bold()
//                        .foregroundColor(.white)
//                }
//                .padding(.top)
//                .offset(y: 110)
//
//
//            }
//            .frame(width: 350)
//            .onAppear{
//                Auth.auth().addStateDidChangeListener{ auth, user in
//                    if user != nil{
//                        userIsLoggedIn.toggle()
//                    }
//
//                }
//            }
//        }
//        .ignoresSafeArea()
//    }
    
    
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            
        }
    }
    
    
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print(error!.localizedDescription)
            }
            
        }
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


//import SwiftUI
//import Firebase
//
//struct ContentView: View {
//
//    @State private var isUserCurrentlyLoggedOut: Bool = false
//
//    var body: some View {
//        NavigationView {
//            if self.isUserCurrentlyLoggedOut {
//                Home(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
//            }else {
//                LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
