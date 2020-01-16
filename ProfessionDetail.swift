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
        ScrollView {
            ZStack(alignment: .topTrailing) {
                Image(profession.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, minHeight: 500, maxHeight: 500)
                    .padding()
                Image(profession.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
                    .cornerRadius(5)
                    .padding()
            }

            HStack {
                Text(profession.description)
                    .padding()
                Spacer(minLength: 0)
            }
            
            NavigationLink("Choose this profession", destination: Text(profession.name))

            Spacer()
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
