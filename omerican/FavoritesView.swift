//
//  FavoritesView.swift
//  omerican
//
//  Created by Rita Marrano on 12/02/23.
//

//import SwiftUI
//
//struct FavoritesView: View {
//    
//    @StateObject var favorites = Favorites()
//    
//    var body: some View {
//        
//        NavigationView {
//            
//            
//            List(favorites) { player in
//                NavigationLink {
//                    Goals(data: player)
//                } label: {
//                    HStack {
//                        Image(systemName: "")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 40, height: 25)
//                            .clipShape(RoundedRectangle(cornerRadius: 5))
//                            .overlay(
//                                RoundedRectangle(cornerRadius: 5)
//                                    .stroke(.black, lineWidth: 1)
//                            )
//                        
//                        Text(player.playerFName)
//
////                        VStack(alignment: .leading) {
////                            Text(data.datas)
////                                .font(.headline)
////                            Text("\(data.runs) runs")
////                                .foregroundColor(.secondary)
////                        }
//
//                        if favorites.contains(player) {
//                            Spacer()
//                            Image(systemName: "heart.fill")
//                                .accessibilityLabel("This is a favorite resort")
//                                .foregroundColor(.red)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Players")
//
//
//            
//        }
//        .environmentObject(favorites)
//    }
//    
//    
//    
//    
//}
//
//struct FavoritesView_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoritesView()
//    }
//}
