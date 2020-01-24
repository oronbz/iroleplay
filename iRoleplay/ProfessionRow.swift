//
//  ProfessionRow.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 14/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct ProfessionRow: View {
    
    static let colors: [String: Color] = ["Strength": .purple,
                                          "Dexterity": .black,
                                          "Charisma": .red,
                                          "Wisdom": .green,
                                          "Intelligence": .pink]
    
    let profession: Profession
    
    var body: some View {
        HStack {
            Image(profession.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(profession.name)
                    .font(.headline)
                Text("Hit Die: d\(profession.hitDie)")
                    .font(.caption)
            }
            
            Spacer()
            
            Text(profession.ability)
                .font(.caption)
                .fontWeight(.black)
                .padding(5)
                .background(Self.colors[profession.ability])
                .cornerRadius(5)
                .foregroundColor(.white)
        }
    }
}

struct ProfessionRow_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                ProfessionRow(profession: Profession.example)
                ProfessionRow(profession: Profession.example)
                ProfessionRow(profession: Profession.example)
            }
            .navigationBarTitle("Professions")
        }
    }
}
