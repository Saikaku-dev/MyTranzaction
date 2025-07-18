//
//  MyTranzactionApp.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

@main
struct MyTranzactionApp: App {
    @StateObject var bankVM = BankViewModel(repository: BankRepoImplLocal())
    @StateObject var bankListVM = BankListViewModel(repository: BankRepoImplLocal())
    let modelContext = SwiftDataManager.shared.modelContext
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(bankVM)
                .environmentObject(bankListVM)
        }
    }
}
