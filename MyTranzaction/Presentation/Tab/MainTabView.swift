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
    let mockUser = MockUser.user
    let modelContext = SwiftDataManager.shared.modelContext
    
    MainTabView()
        .environmentObject(BankViewModel(
            useCase: BankUseCase(bankRepository: BankRepoSwiftDataImpl()),
            user: mockUser))
        .environmentObject(SessionStore(modelContext: modelContext))
}
