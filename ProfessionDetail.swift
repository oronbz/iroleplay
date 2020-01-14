//
//  ProfessionDetail.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 14/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct ProfessionDetail: View {
    let profession: Profession
    
    var body: some View {
        VStack {
            Image(profession.image)
            Text(profession.description)
        }
        .navigationBarTitle(Text(profession.name), displayMode: .inline)
    }
}

struct ProfessionDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfessionDetail(profession: Profession.example)
        }
    }
}
