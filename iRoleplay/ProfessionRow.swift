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
        Image(profession.icon)
        Text(profession.name)
    }
}

struct ProfessionRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfessionRow(profession: Profession.example)
    }
}
