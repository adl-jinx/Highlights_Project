//
//  DataManager.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import Foundation
import SwiftUI
import Firebase

class DataManager: ObservableObject{
    
    @Published var dogs: [Dog] = []
    @Published var players: [Player] = []
    
    init(){
        fetchDog()
    }
    
    func fetchDog(){
        dogs.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        
        ref.getDocuments{ snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    let id = data["id"] as? String ?? ""
                    let breed = data["breed"] as? String ?? ""
                    let player = data["Player"] as? String ?? ""
                    let dog = Dog(id: id, breed: breed, player: player)
                    self.dogs.append(dog)
                }
                
            }
            
        }
    }
    
    
    
    func fetchPlayer(){
        players.removeAll()
        
        let db = Firestore.firestore()
        let ref = db.collection("Players")
        
        ref.getDocuments{ snapshot, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let playerFName = data["playerFName"] as? String ?? ""
                    let playerLName = data["playerLName"] as? String ?? ""
                    let team = data["team"] as? String ?? ""
                    let role = data["role"] as? String ?? ""
//                    let setOfGoal = data["setOfGoals"] as? Goal ?? 
                    
                    
                    let player = Player(id: id, playerFName: playerFName, playerLName: playerLName, team: team, role: role)
                    
                    self.players.append(player)
                }
                
            }
            
        }
    }
    
    //
    
    func addDog(dogBreed: String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBreed)
        let randomId = UUID().uuidString
        ref.setData(["breed": dogBreed, "id": randomId]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }
    
    
    
    
    func addPlayer(dogBreed: String){
        let db = Firestore.firestore()
        let ref = db.collection("Players").document(dogBreed)
        let randomId = UUID().uuidString
        ref.setData(["breed": dogBreed, "id": randomId]) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }

    }

}

