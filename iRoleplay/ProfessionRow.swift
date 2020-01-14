//
//  ProfessionRow.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 14/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct ProfessionRow: View {
    let profession: Profession
    
    var body: some View {
        HStack {
            Image(profession.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
                .cornerRadius(5)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.yellow, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(profession.name)
                    .font(.headline)
                Text("Hit Die: d\(profession.hitDie)")
                    .font(.caption)
            }
            
            Text(profession.ability)
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
