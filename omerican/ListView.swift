//
//  ListView.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import SwiftUI

struct ListView: View {
    
//    @EnvironmentObject var dataManager: DataManager
    
    @Binding var isUserCurrentlyLoggedOut : Bool
    
    @State var shouldShowLogOutOptions = false
    
    @State var search = "search your player"
    @ObservedObject var playersLookup = PlayersLookupViewModel()
    @ObservedObject var data = getData()
    
    @State private var searchText = ""
   
    @StateObject var favorites = Favorites()
    
    var body: some View {
        
//        NavigationView {
//            List {
//                ForEach(data.datas) { player in
//
//                    NavigationLink( destination: Goals(data: player )){
//
//                        Text(player.playerFName)
//
//
//                    }
//
//
//                }
//
//
//            }
//            .navigationTitle("Players")
//            .refreshable {
//                //
////                data.fetchPlayers()
//
//            }
//        }
        
        
        
        
        
        NavigationView {
            List(filteredResorts) { player in
                NavigationLink {
                    Goals(data: player)
                } label: {
                    HStack {
                        Image(systemName: "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        Text(player.playerFName)

//                        VStack(alignment: .leading) {
//                            Text(data.datas)
//                                .font(.headline)
//                            Text("\(data.runs) runs")
//                                .foregroundColor(.secondary)
//                        }

                        if favorites.contains(player) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Players")
            .searchable(text: $searchText, prompt: "Search for a player")

            
        }
        .environmentObject(favorites)
    }
    
    
    
    var filteredResorts: [Player] {
        if searchText.isEmpty {
            return data.datas
        } else {
            return data.datas.filter { $0.playerFName.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    @State static var isUserCurrentlyLoggedOut = false
    
    static var previews: some View {
        ListView( isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
            
    }
}



