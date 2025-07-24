//
//  MyTranzactionApp.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI
import SwiftData

@main
struct MyTranzactionApp: App {
    @StateObject var session: SessionStore
    
    init() {
        _session = StateObject(wrappedValue: SessionStore(modelContext: SwiftDataManager.shared.modelContext))
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(session)
                .environment(\.modelContext, SwiftDataManager.shared.modelContext)
        }
    }
}
