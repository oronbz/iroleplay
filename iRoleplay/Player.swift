//
//  Player.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

class Player: ObservableObject {
    @Published private(set) var characters: [Character] = []
    
    func add(character: Character) {
        characters.append(character)
    }
    
    func remove(character: Character) {
        if let index = characters.firstIndex(of: character) {
            characters.remove(at: index)
        }
    }
}

#if DEBUG
extension Player {
    static var example: Player {
        let player = Player()
        player.add(character: Character.example)
        return player
    }
}
#endif
