//
//  BankUseCase.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/22.
//

import Foundation

class BankUseCase {
    private let bankRepository: BankRepository
    
    init(bankRepository: BankRepository) {
        self.bankRepository = bankRepository
    }
    
    func getAllBanks() -> [Bank] {
        return bankRepository.getAllBanks()
    }
    
    func addBank(_ bank: Bank) {
        bankRepository.addBank(bank)
    }
    
    func deleteBank(_ bank: Bank) {
        bankRepository.deleteBank(bank)
    }
}
