//
//  Database.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import Foundation

class Database {
    static var professionBooks: [ProfessionBook] {
        return Bundle.main.decode([ProfessionBook].self, from: "professions.json")
    }
    
    static var races = ["Dragonborn", "Dwarf", "Elf", "Gnome", "Goliath", "Half-Elf", "Halfling", "Half-Orc", "Human", "Tiefling"]
}

private extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
