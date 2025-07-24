//
//  BankRepoImplLocal.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

class BankRepoSwiftDataImpl: BankRepository {
    private let context: ModelContext
    
    init(context: ModelContext = SwiftDataManager.shared.modelContext) {
        self.context = context
    }
    
    func getAllBanks(for user: User) -> [Bank] {
        return user.banks
    }
    
    func addBank(_ bank: Bank, to user: User) {
        user.banks.append(bank)
        context.insert(bank)
        try? context.save()
    }
    
    func deleteBank(_ bank: Bank) {
        context.delete(bank)
        try? context.save()
    }
}
