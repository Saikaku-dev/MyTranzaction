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
    
    func getAllBanks(for user: User) -> [Bank] {
        return bankRepository.getAllBanks(for: user)
    }
    
    func addBank(_ bank: Bank, to user: User) {
        bankRepository.addBank(bank, to: user)
    }
    
    func deleteBank(_ bank: Bank) {
        bankRepository.deleteBank(bank)
    }
}
