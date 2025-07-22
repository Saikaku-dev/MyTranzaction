//
//  SwiftDataManager.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

final class SwiftDataManager {
    static let shared = SwiftDataManager()
    
    private let container: ModelContainer
    let modelContext: ModelContext
    
    private init() {
        do {
            container = try ModelContainer(for: Bank.self, User.self)
        } catch {
            fatalError("Unable to initialize ModelContainer: \(error)")
        }
        modelContext = container.mainContext
    }
}
