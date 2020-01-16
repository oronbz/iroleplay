//
//  AppView.swift
//  iRoleplay
//
//  Created by Oron Ben Zvi on 16/01/2020.
//  Copyright © 2020 Oron Ben Zvi. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "person.badge.plus.fill")
                    Text("Create")
                }
            
            Text("My Characters")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let player = Player.example
    
    static var previews: some View {
        AppView()
            .environmentObject(player)
    }
}
