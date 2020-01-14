//
//  Profession.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import Foundation

struct ProfessionBook: Codable {
    let id: UUID
    let name: String
    let professions: [Profession]
}

struct Profession: Codable, Equatable {
    let id: UUID
    let name: String
    let hitDie: Int
    let description: String
    let ability: String
    
    var icon: String {
        name.replacingOccurrences(of: " ", with: "").lowercased() + "-icon"
    }
    
    var image: String {
        name.replacingOccurrences(of: " ", with: "").lowercased() + "-image"
    }
}

#if DEBUG
extension Profession {
    static let example = Profession(id: UUID(),
                                    name: "Wizard",
                                    hitDie: 6,
                                    description: "A scholarly magic-user capable of manipulating the structures of reality",
                                    ability: "Intelligence")
}
#endif
