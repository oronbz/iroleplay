//
//  CharacterDetail.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 15/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct CharacterDetail: View {
    
    @EnvironmentObject var player: Player
    
    let profession: Profession
    
    static let races = Database.races
    static let equipments = ["Sword and Shield", "Staff", "Gold"]
    
    @State private var race = 0
    @State private var hasStartingEquipment = false
    @State private var startingEquipment = 0
    @State private var level = 1
    @State private var name = ""
    @State private var isShowingCharacterAlert = false
    
    var body: some View {
        Form {
            Section {
                Text("Profession: \(profession.name)")
                
                Picker("What is your race?", selection: $race) {
                    ForEach(0..<Self.races.count, id: \.self) {
                        Text(Self.races[$0])
                    }
                }
                
                Toggle(isOn: $hasStartingEquipment.animation()) {
                    Text("Add starting equipment")
                }
                
                if hasStartingEquipment {
                    Picker("What is your starting equipment?", selection: $startingEquipment) {
                        ForEach(0..<Self.equipments.count, id: \.self) {
                            Text(Self.equipments[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Stepper("Level: \(level)", value: $level, in: 1...20)
                
                TextField("Your name", text: $name)
                    .disableAutocorrection(true)

                HStack {
                    Spacer()
                    Image(profession.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    Spacer()
                }

            }
            
            Section {
                Button("Create your character") {
                    self.isShowingCharacterAlert = true
                    let character = Character(profession: self.profession,
                                              name: self.name,
                                              race: Self.races[self.race],
                                              level: self.level,
                                              startingEquipment: self.hasStartingEquipment ? Self.equipments[self.startingEquipment] : "")
                    self.player.add(character: character)
                }
                .alert(isPresented: $isShowingCharacterAlert) {
                    Alert(title: Text("Your character is created"),
                          message: Text("\(name), a level \(level) \(Self.races[race]) \(profession.name)"),
                          dismissButton: Alert.Button.default(Text("OK")))
                }
            }
            
        }
        .navigationBarTitle(Text("Character Details"), displayMode: .inline)
    }
}

struct CharacterDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CharacterDetail(profession: Profession.example)
                .environmentObject(Player.example)
        }
    }
}
