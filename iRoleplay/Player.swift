//
//  Player.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

class Player: ObservableObject {
    @Published var characters: [Character] = []
    
    func add(character: Character) {
        characters.append(character)
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
