//
//  ContentView.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 13/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let professionBooks = Database.professionBooks
    
    var body: some View {
        NavigationView {
            List {
                ForEach(professionBooks) { book in
                    Section(header: Text(book.name)) {
                        ForEach(book.professions) { profession in
                            Text(profession.name)
                        }
                    }
                }
            }
            .navigationBarTitle("Professions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
