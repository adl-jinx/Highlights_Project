//
//  PlayersLookupViewModel.swift
//  omerican
//
//  Created by Rita Marrano on 03/02/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class PlayersLookupViewModel: ObservableObject {
    @Published var queryResultPlayers: [Player] = []
    
    private let db = Firestore.firestore()
    init(){
//        let playersCollection = db.collection("Players")
    }
        func fetchPlayers(with keyword: String) {
            db.collection("Players").whereField("keywordsForLookup", arrayContains: keyword).getDocuments { querySnapshot, error in
                guard let documents = querySnapshot?.documents, error == nil else {
                    print("No documents")
                    return
                }
                self.queryResultPlayers = documents.compactMap { queryDocumentSnapshot in
                    try? queryDocumentSnapshot.data(as: Player.self)
                }
                
                
            }
        }
    
}
