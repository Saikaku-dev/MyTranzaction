//
//  BankListViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

final class BankListViewModel:ObservableObject { //使われてない
    @Published var myBanks: [String] = []
    @Published var myCards: [String] = []
    @Published var myMonies: [String] = []
    
    func addBank(_ bank: String) {
        myBanks.append(bank)
    }
    
    func addCard(_ card: String) {
        myCards.append(card)
    }
    
    func addMoney(_ money: String) {
        myMonies.append(money)
    }
}
