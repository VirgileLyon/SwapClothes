//
//  MainView.swift
//  Message
//
//  Created by Ny Dina on 18/03/2021.
//

import SwiftUI

struct MainView: View {
    
    @State private var matchCount = userA.matches.count
    
    @ObservedObject var settingsStore: SettingsStore
    var body: some View {
        
        TabView {
            CarouselView()
                .tabItem {
                    Image(systemName: "arrow.left.arrow.right.circle")
                    Text("Swap")
                }
            MessageList()
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
            AddArticle()
                .tabItem {
                    Image(systemName: "plus.app")
                    Text("Add")
                }
            ProfileView(settingsStore: self.settingsStore)
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                    
                }
        }
        .accentColor(.mint)
                
        
           
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(settingsStore: SettingsStore())
    }
}
