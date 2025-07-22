//
//  MyTranzactionApp.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

@main
struct MyTranzactionApp: App {
    @StateObject var session: SessionStore
    
    init() {
        let modelContext = SwiftDataManager.shared.modelContext
        _session = StateObject(wrappedValue: SessionStore(modelContext: modelContext))
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(session)
        }
    }
}
