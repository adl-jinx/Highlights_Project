//
//  Favorites.swift
//  omerican
//
//  Created by Rita Marrano on 08/02/23.
//

import Foundation


class Favorites: ObservableObject, Identifiable {

    let id = UUID()
    @Published var players: Set<String>
    private let FAV_KEY = "fav_key"

    
    
    init()
    {
        players = []
    }
    
    func contains(_ player: Player) -> Bool {
        players.contains(player.id)
    }

    func add(_ player: Player) {
        objectWillChange.send()
        players.insert(player.id)
        save()
    }

    func remove(_ player: Player) {
        objectWillChange.send()
        players.remove(player.id)
        save()
    }

    func save() {
        // write out our data
    }
}
