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
    
    private let useCase: BankUseCase
    private let user: User
    
    init(useCase: BankUseCase, user: User) {
        self.useCase = useCase
        self.user = user
        fetchBanks()
    }
    
    func fetchBanks() {
        let banks = useCase.getAllBanks(for: user)
        myBanks = banks
    }
    
    func deleteBank(_ bank: Bank) {
        useCase.deleteBank(bank)
        fetchBanks()
    }
}
