//
//  Character.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import Foundation

struct Character: Equatable {
    let profession: Profession
    let name: String
    let race: String
    let level: Int
    let startingEquipment: String
}

#if DEBUG
extension Character {
    static var example: Character {
        Character(profession: Profession.example, name: "Freak4pc", race: "Goliath", level: 19, startingEquipment: "Staff")
    }
}
#endif
