//
//  Goals.swift
//  omerican
//
//  Created by Rita Marrano on 01/02/23.
//

import SwiftUI

struct Goals: View{

    var data : Player
    @EnvironmentObject var favorites: Favorites
    
    var body: some View{
        
        
        let columns = [
            GridItem(.adaptive(minimum: 70))
        ]
        
        VStack(spacing: 5){
            
            
                Text("\(data.playerFName)   \(data.playerLName)")
                .font(.system(size: 30).bold())
                .padding(10)
                .foregroundColor(.black)

                
                
            
                Text(data.team)
                .font(.system(size: 25).bold())
                .padding(6)
                .foregroundColor(.gray)
 
                Text(data.role)
                .font(.system(size: 20).bold())
                .padding(6)
                .foregroundColor(.blue)
            
            
            
            //funziona per finta
            Button(favorites.contains(data) ? "Remove from Favorites" : "Add to Favorites") {
                if favorites.contains(data) {
                    favorites.remove(data)
                } else {
                    favorites.add(data)
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
            
            ScrollView{
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(data.goals){ goal in
                        NavigationLink( destination: GoalsDetail(data: data)){
                            ZStack{
                                Rectangle()
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(6)
                                Text("\(goal.match)")
                                    .foregroundColor(.white)
//                                    .font(.system(size: 18).bold())
//                                    .padding(6)
//                                    .foregroundColor(.white)
//                                    .background(Color.red)
//                                    .cornerRadius(6)
                                
                            }
                        }
                    }
                }
                    
                }
                
            
            .navigationTitle("Goals")

            
        }
    }
    
}

//struct Goals_Previews: PreviewProvider {
//    static var previews: some View {
//        Goals()
//    }
//}
