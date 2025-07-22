//
//  MyTranzactionApp.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

@main
struct MyTranzactionApp: App {
    @StateObject var session = SessionStore()
    @StateObject var homeVM = HomeViewModel()
    @StateObject var bankVM = BankViewModel(repository: BankRepoImplLocal())
    @StateObject var bankListVM = BankListViewModel(repository: BankRepoImplLocal())
    let modelContext = SwiftDataManager.shared.modelContext
    
    var body: some Scene {
        WindowGroup {
            LoginView(vm: LoginViewModel(session: session))
                .environmentObject(bankVM)
                .environmentObject(bankListVM)
                .environmentObject(session)
                .environmentObject(homeVM)
        }
    }
}
