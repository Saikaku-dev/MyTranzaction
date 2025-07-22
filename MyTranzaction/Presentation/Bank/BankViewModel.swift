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
    @Published var assetAmount: Int?
    
    private let useCase: BankUseCase
    
    init(useCase: BankUseCase) {
        self.useCase = useCase
        fetchBanks()
    }
    
    func fetchBanks() {
        myBanks = useCase.getAllBanks()
        updateAsset()
    }
    
    func deleteBank(_ bank: Bank) {
        useCase.deleteBank(bank)
        fetchBanks()
    }
    
    func updateAsset() {
        assetAmount = myBanks.reduce(0) { $0 + $1.balance }
    }
}
