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
            Text(profession.name)
            Text("Hit Die: d\(profession.hitDie)")
            Text(profession.ability)
        }
    }
}

struct ProfessionRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionRow(profession: Profession.example)
    }
}
