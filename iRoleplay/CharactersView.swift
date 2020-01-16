//
//  CharactersView.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 16/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var player: Player
    
    var body: some View {
        NavigationView {
            List {
                ForEach(player.characters) { character in
                    HStack {
                        Image(character.profession.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .cornerRadius(5)
                            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow, lineWidth: 2))
                        Text("\(character.name), a level \(character.level) \(character.race) \(character.profession.name)")
                    }
                }
                .onDelete(perform: deleteCharacters)
            }
            .navigationBarTitle("My Characters")
        }
    }
    
    func deleteCharacters(at offsets: IndexSet) {
        player.characters.remove(atOffsets: offsets)
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var player = Player.example
    
    static var previews: some View {
        CharactersView()
            .environmentObject(player)
    }
}
