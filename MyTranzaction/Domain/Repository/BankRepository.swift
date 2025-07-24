//
//  BankRepository.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation

protocol BankRepository {
    func getAllBanks(for user: User) -> [Bank]
    func addBank(_ bank: Bank, to user: User)
    func deleteBank(_ bank: Bank)
}
