//
//  Goal.swift
//  omerican
//
//  Created by Rita Marrano on 27/01/23.
//

import Foundation
import SwiftUI
import Firebase


struct Goal: Hashable, Identifiable{
    
    var id: String
    var playerFName: String
    var playerLName: String
    var assist: String //??? un altra struct
    var type: String
    var url: String 
    
    var match: String
}


//struct Assist: Hashable, Identifiable{
//
//    var id: String
//    var playerFName: String
//    var playerLName: String
//    var goal: Goal
//
//
//}
