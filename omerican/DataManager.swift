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
}

