//
//  PlayersSearchView.swift
//  omerican
//
//  Created by Rita Marrano on 03/02/23.
//

import SwiftUI

struct PlayersSearchView: View {
    @Binding var isUserCurrentlyLoggedOut : Bool
    @EnvironmentObject var player: PlayerViewModel
    @ObservedObject var playersLookup = PlayersLookupViewModel()
    @ObservedObject var data = getData()
    @State var keyword = ""
    
    var body: some View {
        let keywordBinding = Binding<String>(
            get: {
                keyword
            },
            set: {
                keyword = $0
                playersLookup.fetchPlayers(with: keyword)
            }
        )
        VStack {
//            HStack {
//                Button(action: {
//                    user.signOut()
//                }) {
//                    Text("Sign out")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .clipShape(Capsule())
//                }
//                .padding(.leading, 13)
//                Spacer()
//            }
            SearchBarView(keyword: keywordBinding)
            ScrollView {
                ForEach(playersLookup.queryResultPlayers, id: \.id) { player in
                    PlayersSearchView(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SearchBarView: View {
    @Binding var keyword: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray.opacity(0.5))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Searching for...", text: $keyword)
                .autocapitalization(.none)
            }
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

struct ProfileBarView: View {
    var player: Player
    
    var body: some View {
        ZStack {
            Rectangle()
            .foregroundColor(Color.gray.opacity(0.2))
            HStack {
                Text("\(player.playerLName)")
                Spacer()
                Text("\(player.playerFName) \(player.playerLName)")
            }
            .padding(.horizontal, 10)
        }
        .frame(maxWidth: .infinity, minHeight: 100)
        .cornerRadius(13)
        .padding()
    }
}
