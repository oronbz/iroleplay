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
    
    var body: some View {
        VStack {
            Text("Profession: \(profession.name)")
        }
    }
}

struct CharacterForm_Previews: PreviewProvider {
    static var previews: some View {
        CharacterForm(profession: Profession.example)
    }
}
