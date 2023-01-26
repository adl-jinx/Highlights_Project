//
//  ListView.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(dataManager.dogs, id: \.id) { dog in
                    NavigationLink() {
                        Text(dog.breed)
                        Button("See the goal!!") {
                            if let url = URL(string: dog.breed) {
                                UIApplication.shared.open(url)
                            }
                        }.buttonStyle(.bordered)
                        Text(dog.breed)
                    } label : {
                        Text(dog.player)
                    }
                }
            /*
            List(dataManager.dogs, id: \.id) { dog in
                Text(dog.breed)
                */
                
            }
            .navigationTitle("Dogs")
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
                NewDogView()
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
