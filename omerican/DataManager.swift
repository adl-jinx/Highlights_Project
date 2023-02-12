//
//  DataManager.swift
//  omerican
//
//  Created by Rita Marrano on 24/01/23.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore




class getData : ObservableObject {
    
//    @Published var datas = [Player]()
//    @Published var datas1 = [Goal]()
    @Published var datas = [Player]()
    
    init() {
        let db = Firestore.firestore()
        let playersCollection = db.collection("Players")
        
        playersCollection.getDocuments(completion: { snapshot, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            guard let docs = snapshot?.documents else { return }
            
            for doc in docs {
                
                let id = doc.documentID
                
                
                let playerFName = doc.get("playerFName") as! String
                let playerLName = doc.get("playerLName") as! String
                let team = doc.get("team") as! String
                let role = doc.get("role") as! String
                //print(seq, title) dont put this here
                var goals = [Goal]()
                
//                var player = Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//                self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
                
                playersCollection.document(doc.documentID).collection("Goals").getDocuments(completion: { goalSnap, error in
                    if let err = error {
                        print(err.localizedDescription)
                        return
                    }
                    
                    guard let rowDocs = goalSnap?.documents else { return }
                    print(playerFName, playerLName) //
                    
                    
                    for goal in rowDocs {
                        let id = goal.documentID
                        let type = goal.get("type") as! String
                        let url = goal.get("url") as! String
                        let match = goal.get("match") as? String ?? "No row content"
                        let assist = goal.get("assist") as! String
                        
                        var g : Goal
                        
                        g = Goal(id:id, type: type, url: url, match: match, assist: assist)
                        goals.append(g)
                        print("  ",id, type, url, match)
//                        self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
                    }
                    self.datas.append(Player(id: id, playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
                })
                
            }
        })
    }
}







//class getData : ObservableObject {
//
//
//    @Published var datas = [Player]()
//
//
//    var db = Firestore.firestore()
//
//    init(searchTerm: String = "") {
//
//        let playersCollection = db.collection("Players")
//
//
//
//        playersCollection.whereField("keywordsForLookup",  arrayContains: searchTerm).getDocuments{ querySnapshot, error in
//            guard let documents = querySnapshot?.documents, error == nil else
//            {
//                print("no doc")
//                return
//
//            }
//            self.datas = documents.compactMap{ queryDocumentSnapshot in
//                try? queryDocumentSnapshot.data(as: Player.self)
//            }
//        }
//
//        playersCollection.getDocuments(completion: { snapshot, error in
//            if let err = error {
//                print(err.localizedDescription)
//                return
//            }
//
//            guard let docs = snapshot?.documents else { return }
//
//            for doc in docs {
//
////                let id = doc.documentID
//
//                let id = doc.get("id") as! String
//                let playerFName = doc.get("playerFName") as! String
//                let playerLName = doc.get("playerLName") as! String
//                let team = doc.get("team") as! String
//                let role = doc.get("role") as! String
//                //print(seq, title) dont put this here
//                var goals = [Goal]()
////                var isFaved = doc.get("isFaved") as! Bool
//
//                //                var player = Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//                //                self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//
//                playersCollection.document(doc.documentID).collection("Goals").getDocuments(completion: { goalSnap, error in
//                    if let err = error {
//                        print(err.localizedDescription)
//                        return
//                    }
//
//                    guard let rowDocs = goalSnap?.documents else { return }
//                    print(playerFName, playerLName) //
//
//
//                    for goal in rowDocs {
////                        let id = goal.documentID
//                        let id = goal.get("id") as! String
//                        let type = goal.get("type") as! String
//                        let url = goal.get("url") as! String
//                        let match = goal.get("match") as? String ?? "No row content"
//                        let assist = goal.get("assist") as! String
//
//                        var g : Goal
//
//                        g = Goal(id: id, type: type, url: url, match: match, assist: assist)
//                        goals.append(g)
//                        print("  ",id, type, url, match)
//                        //                        self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//                    }
//                    self.datas.append(Player(id: id, playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//                })
//
//            }
//        })
//    }
//
//}


//        playersCollection.getDocuments(completion: { snapshot, error in
//            if let err = error {
//                print(err.localizedDescription)
//                return
//            }
//
//            guard let docs = snapshot?.documents else { return }
//
//            for doc in docs {
//
//                let id = doc.documentID
//
//
//                let playerFName = doc.get("playerFName") as! String
//                let playerLName = doc.get("playerLName") as! String
//                let team = doc.get("team") as! String
//                let role = doc.get("role") as! String
//                //print(seq, title) dont put this here
//                var goals = [Goal]()
//
//                //                var player = Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//                //                self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//
//                playersCollection.document(doc.documentID).collection("Goals").getDocuments(completion: { goalSnap, error in
//                    if let err = error {
//                        print(err.localizedDescription)
//                        return
//                    }
//
//                    guard let rowDocs = goalSnap?.documents else { return }
//                    print(playerFName, playerLName) //
//
//
//                    for goal in rowDocs {
//                        let id = goal.documentID
//                        let type = goal.get("type") as! String
//                        let url = goal.get("url") as! String
//                        let match = goal.get("match") as? String ?? "No row content"
//                        let assist = goal.get("assist") as! String
//
//                        var g : Goal
//
//                        g = Goal(type: type, url: url, match: match, assist: assist)
//                        goals.append(g)
//                        print("  ",id, type, url, match)
//                        //                        self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//                    }
//                    //                    self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//                    //                    return Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//                })
//
//            }
//        })
//    }

        
//                db.collection("Players").document(id).collection("Goals").addSnapshotListener {(queryDocumentSnapshot,error) in
//                    guard let rowDocs = querySnapshot?.documents else {
//                        print("no doc")
//                        return
//                    }
//
//
//                }
//                let goals = data["goals"] as! [Goal]
        //print(seq, title) dont put this here
        //                                var goals = [Goal]()
        
        
        
        //                playersCollection.document(doc.documentID).collection("Goals").getDocuments(completion: { goalSnap, error in
        //                    if let err = error {
        //                        print(err.localizedDescription)
        //                        return
        //                    }
        //
        //                    guard let rowDocs = goalSnap?.documents else { return }
        //                    print(playerFName, playerLName) //
        //
        //
        //                    for goal in rowDocs {
        //                        let id = goal.documentID
        //                        let type = goal.get("type") as! String
        //                        let url = goal.get("url") as! String
        //                        let match = goal.get("match") as? String ?? "No row content"
        //                        let assist = goal.get("assist") as! String
        //
        //                        var g : Goal
        //
        //                        g = Goal(type: type, url: url, match: match, assist: assist)
        //                        goals.append(g)
        //                        print("  ",id, type, url, match)
        //                        //                        self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
        //                    }
        //                    //                    self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
        //                    //                    return Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
        //                })

        
        
        
//    func fetchPlayers(){
//        let db = Firestore.firestore()
//        let playersCollection = db.collection("Players")
//
//        playersCollection.getDocuments(completion: { snapshot, error in
//            if let err = error {
//                print(err.localizedDescription)
//                return
//            }
//
//            guard let docs = snapshot?.documents else { return }
//
//            for doc in docs {
//
//                let id = doc.documentID
//
//
//                let playerFName = doc.get("playerFName") as! String
//                let playerLName = doc.get("playerLName") as! String
//                let team = doc.get("team") as! String
//                let role = doc.get("role") as! String
//                //print(seq, title) dont put this here
//                var goals = [Goal]()
//
////                var player = Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
////                self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//
//                playersCollection.document(doc.documentID).collection("Goals").getDocuments(completion: { goalSnap, error in
//                    if let err = error {
//                        print(err.localizedDescription)
//                        return
//                    }
//
//                    guard let rowDocs = goalSnap?.documents else { return }
//                    print(playerFName, playerLName) //
//
//
//                    for goal in rowDocs {
//                        let id = goal.documentID
//                        let type = goal.get("type") as! String
//                        let url = goal.get("url") as! String
//                        let match = goal.get("match") as? String ?? "No row content"
//                        let assist = goal.get("assist") as! String
//
//                        var g : Goal
//
//                        g = Goal(type: type, url: url, match: match, assist: assist)
//                        goals.append(g)
//                        print("  ",id, type, url, match)
////                        self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
//                    }
////                    self.datas.append(Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals))
////                    return Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//                })
//
//            }
//        })
//    }



//    func fetchPlayers(){
//        db.collection("Players").document().collection("Goals").addSnapshotListener{ (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("no doc")
//                return
//            }
//
//            documents.collection("Goals").getDocuments { snapshot, error in
//                if let error = error {
//                    print(error)
//                }
//                guard let document = snapshot,
//                      let data = document.data(),
//                let playerFName = data["playerFName"] as! String,
//                    let playerLName = data["playerLName"] as! String,
//                    let team = data["team"] as! String,
//                    let role = data["role"] as! String,
//                    var goals = [Goal]() else { return }
//
//            }
//        }
//    }



//    func fetchPlayers()
//    {
//
//
//        db.collection("Players").addSnapshotListener{ (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("no doc")
//                return
//            }
//
//            self.datas =  documents.map { (queryDocumentSnapshot) in
//                let data = queryDocumentSnapshot.data()
//
//                let id = data["id"] as! String
//                let playerFName = data["playerFName"] as! String
//                let playerLName = data["playerLName"] as! String
//                let team = data["team"] as! String
//                let role = data["role"] as! String
//                var goals = [Goal]()
//
//
//
//                self.db.collection("Player").document(id).collection("Goals").addSnapshotListener{ (querySnapshot1, error1) in
//                    guard let documents1 = querySnapshot1?.documents else {
//                        print("no doc")
//                        return
//                    }
//
//                    self.datas =  documents1.map { (queryDocumentSnapshot1) -> Goal in
//                        let data = queryDocumentSnapshot1.data()
//
////                                                let id = goal.documentID
//                                                let type = data["type"] as! String
//                                                let url = data["url"] as! String
//                                                let match = data["match"] as? String ?? "No row content"
//                                                let assist = data["assist"] as! String
//
//                                                var g : Goal
//
//                                                g = Goal(type: type, url: url, match: match, assist: assist)
//
//                                                goals.append(g)
//
//
//
//                    }
//
//
//
//
//                }
//                return Player(playerFName: playerFName, playerLName: playerLName, team: team, role: role, goals: goals)
//
//
//
//            }
//
//        }
//    }
