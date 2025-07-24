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
    
    func fetchAllUsers() -> [User] {
        let descriptor = FetchDescriptor<User>()
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func getUser(byAccount account: String) -> User? {
        let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.account == account})
        return (try? context.fetch(descriptor).first)
    }
    
    func saveUser(_ user: User) {
        context.insert(user)
        try? context.save()
    }
    
    func deleteUser(_ user: User) {
        for bank in user.banks {
            context.delete(bank)
        }
        context.delete(user)
        try? context.save()
    }
}
