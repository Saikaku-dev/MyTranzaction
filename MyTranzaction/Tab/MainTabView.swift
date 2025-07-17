//
//  MainTabView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            BankView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Bank")
                }
        }
    }
}

#Preview {
    MainTabView()
}
