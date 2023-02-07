//
//  GoalsDetail.swift
//  omerican
//
//  Created by Rita Marrano on 01/02/23.
//

import SwiftUI

struct GoalsDetail: View {
    
    var data : Player
    
    var body: some View {
        
        VStack{
           
 
            
            ForEach(data.goals){ goal in
        
                Text(goal.type)
                Text(goal.assist)
                
                Link(destination: URL(string: "\(goal.url)")!, label: {
                    Label("watch goal on youTube", systemImage: "play.rectangle.fill")
                        .font(.system(size: 18).bold())
                        .padding(6)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(6)
                })
                
            }
            
        }.navigationTitle("Goals")
    }
}

//struct GoalsDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalsDetail()
//    }
//}
