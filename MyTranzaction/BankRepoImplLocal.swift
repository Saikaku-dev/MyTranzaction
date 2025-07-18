//
//  BankRepoImplLocal.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

class BankRepoImplLocal: BankRepository {
    private let context: ModelContext
    
    init(context: ModelContext = SwiftDataManager.shared.modelContext) {
        self.context = context
    }
    
    func getAllBanks() -> [Bank] {
        let descriptor = FetchDescriptor<Bank>()
        return (try? context.fetch(descriptor)) ?? []
    }
    
    func addBank(_ bank: Bank) {
        context.insert(bank)
        try? context.save()
    }
    
    func deleteBank(_ bank: Bank) {
        context.delete(bank)
        try? context.save()
    }
}
