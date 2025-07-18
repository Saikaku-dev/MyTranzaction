//
//  MyTranzactionApp.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

@main
struct MyTranzactionApp: App {
    let repository = BankRepoImplLocal()
    @StateObject var bankVM = BankViewModel()
    let modelContext = SwiftDataManager.shared.modelContext
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(bankVM)
        }
    }
}
