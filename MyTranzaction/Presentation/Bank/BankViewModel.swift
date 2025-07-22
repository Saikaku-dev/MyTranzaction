//
//  BankViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

final class BankViewModel: ObservableObject {
    @Published var myBanks: [Bank] = []
    @Published var myCards: [String] = []
    @Published var myMonies: [String] = []
    private var repository: BankRepository
    @Published var assetAmount: Int?
    
    init(repository: BankRepository) {
        self.repository = repository
        fetchBanks()
    }
    
    func fetchBanks() {
        myBanks = repository.getAllBanks()
        updateAsset()
    }
    
    func deleteBank(_ bank: Bank) {
        repository.deleteBank(bank)
        fetchBanks()
    }
    
    func updateAsset() {
        assetAmount = myBanks.reduce(0) { $0 + $1.balance }
    }
}
