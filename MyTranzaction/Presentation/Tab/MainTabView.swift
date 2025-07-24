//
//  MainTabView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var session: SessionStore
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            BankView(user: session.currentUser!)
                .tabItem {
                    Image(systemName: "chineseyuanrenminbisign.bank.building")
                    Text("Bank")
                }
            TodoView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Todo")
                }
        }
    }
}

#Preview {
    MainTabView()
}
