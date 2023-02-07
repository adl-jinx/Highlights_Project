//
//  Player.swift
//  omerican
//
//  Created by Rita Marrano on 27/01/23.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Player: Codable, Identifiable{
    
    @DocumentID var id: String? = UUID().uuidString
    
    var playerFName: String
    var playerLName: String
    var team: String
    var role: String //?
    
    var goals: [Goal]
    
    var keywordsForLookup: [String] {
        [self.playerFName.generateStringSequence(), self.playerLName.generateStringSequence(), self.playerFName.generateStringSequence(), "\(self.playerLName) \(self.playerFName)".generateStringSequence()].flatMap { $0 }
    }
    
}
struct Goal: Codable, Identifiable {
    
    @DocumentID var id: String? = UUID().uuidString
    
//    var assist: Player
    var type: String
    var url: String
    var match: String
    var assist: String
}




extension String {
    func generateStringSequence() -> [String] {
        /// E.g) "Mark" yields "M", "Ma", "Mar", "Mark"
        var sequences: [String] = []
        for i in 1...self.count {
            sequences.append(String(self.prefix(i)))
        }
        return sequences
    }
}
