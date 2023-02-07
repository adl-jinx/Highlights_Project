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
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(data.datas) { player in

                    NavigationLink( destination: Goals(data: player )){
                        
                        Text(player.playerFName)
                        
                        
                    }
                    
                    
                }

                
            }
            .navigationTitle("Players")
            .refreshable {
                //
//                data.fetchPlayers()
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    @State static var isUserCurrentlyLoggedOut = false
    
    static var previews: some View {
        ListView( isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
            
    }
}



