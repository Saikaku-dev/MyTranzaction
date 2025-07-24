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
    @Published var assetAmount: Int?
    
    private let useCase: BankUseCase
    var currentUser: User
    
    init(useCase: BankUseCase, user: User) {
        self.useCase = useCase
        self.currentUser = user
        fetchBanks()
    }
    
    func setUser(_ user: User) {
        guard user.id != currentUser.id else { return }
        currentUser = user
        fetchBanks()
    }
    
    func fetchBanks() {
        let banks = useCase.getAllBanks(for: currentUser)
        myBanks = banks
    }
    
    func deleteBank(_ bank: Bank) {
        useCase.deleteBank(bank)
        fetchBanks()
    }
}
