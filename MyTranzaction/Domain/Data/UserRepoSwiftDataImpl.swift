//
//  UserRepoSwiftDataImpl.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/22.
//

import Foundation
import SwiftData

class UserRepoSwiftDataImpl: UserRepository {
    private let context: ModelContext
    
    init(context: ModelContext = SwiftDataManager.shared.modelContext) {
        self.context = context
    }
    
    
    func getUser(account: String, password: String) -> User? {
        let fetchDescriptor = FetchDescriptor<User>(
            predicate: #Predicate { $0.account == account && $0.password == password }
        )
        return try? context.fetch(fetchDescriptor).first
    }
    
    func saveUser(_ user: User) {
        context.insert(user)
        try? context.save()
    }
}
