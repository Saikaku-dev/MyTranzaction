//
//  BankListViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

final class BankListViewModel:ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var selectedBank = MockBank.banks[0]
    @Published var selectedCard = MockBank.cards[0]
    @Published var selectedPayment = MockBank.electronicMoney[0]
    
    @Published var myBanks: [String] = []
    @Published var myCards: [String] = []
    @Published var myElectronicMoney: [String] = []
    
    let loader = LoadBankList()
    
    init() {
        self.myBanks = loader.load()
        self.myCards = MockBank.cards
        self.myElectronicMoney = MockBank.electronicMoney
    }
    
    func addBank(_ bank: String) {
        myBanks.append(bank)
    }
    
    func addCard(_ card: String) {
        myCards.append(card)
    }
    
    func addMoney(_ money: String) {
        myElectronicMoney.append(money)
    }
    
    func filteredBanks(_ keyword: String) -> [String] {
        if keyword.isEmpty {
            return myBanks
        } else {
            return myBanks.filter { $0.localizedCaseInsensitiveContains(keyword) }
        }
    }
    func filteredCards(_ keyword: String) -> [String] {
        if keyword.isEmpty {
            return myCards
        } else {
            return myCards.filter { $0.localizedCaseInsensitiveContains(keyword) }
        }
    }
    func filteredElectronicMoney(_ keyword: String) -> [String] {
        if keyword.isEmpty {
            return myElectronicMoney
        } else {
            return myElectronicMoney.filter { $0.localizedCaseInsensitiveContains(keyword) }
        }
    }
}
