//
//  CharacterForm.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 15/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct CharacterForm: View {
    let profession: Profession
    
    let races = Database.races
    
    @State private var race = 0
    @State private var hasStartingEquipment = false
    @State private var equipments = ["Sword and Shield", "Staff", "Gold"]
    @State private var startingEquipment = 0
    
    var body: some View {
        Form {
            Text("Profession: \(profession.name)")
            
            Picker("What is your race?", selection: $race) {
                ForEach(0..<races.count) {
                    Text(self.races[$0])
                }
            }
            
            Toggle(isOn: $hasStartingEquipment) {
                Text("Add starting equipment")
            }
            
            if hasStartingEquipment {
                Picker("What is your starting equipment?", selection: $startingEquipment) {
                    ForEach(0..<equipments.count) {
                        Text(self.equipments[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
        }
        .navigationBarTitle(Text("Character Details"), displayMode: .inline)
    }
}

struct CharacterForm_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterForm(profession: Profession.example)
        }
    }
}
