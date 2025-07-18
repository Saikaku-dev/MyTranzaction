//
//  BankRepository.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation

protocol BankRepository {
    func getAllBanks() -> [Bank]
    func addBank(_ bank: Bank)
    func deleteBank(_ bank: Bank)
}
