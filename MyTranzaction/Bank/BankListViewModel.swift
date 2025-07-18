//
//  BankListViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine
import SwiftUI

final class BankListViewModel:ObservableObject {
    @Published var selectedIndex: Int = 0
    @Published var selectedBank = MockBank.banks[0]
    @Published var selectedCard = MockBank.cards[0]
    @Published var selectedPayment = MockBank.electronicMoney[0]
    
    @Published var banks: [String] = []
    @Published var myCards: [String] = []
    @Published var myElectronicMoney: [String] = []
    //金額入力ためのハンドル
    @Published var showAlert:Bool = false
    @Published var inputMoney:String = ""
    @Published var bankName: String = ""
    let loader = LoadBankList()
    @EnvironmentObject var bankVM: BankViewModel
    var bank: Bank?
    
    init() {
        self.banks = loader.load()
        self.myCards = MockBank.cards
        self.myElectronicMoney = MockBank.electronicMoney
    }
    
    func addBank(_ bank: Bank) {
//        banks.append(bank)
    }
    
    func addCard(_ card: String) {
        myCards.append(card)
    }
    
    func addMoney(_ money: String) {
        myElectronicMoney.append(money)
    }
    
    func filteredBanks(_ keyword: String) -> [String] {
        if keyword.isEmpty {
            return banks
        } else {
            return banks.filter { $0.localizedCaseInsensitiveContains(keyword) }
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
    
    func checkingType() {
        guard let moneyInt = Int(inputMoney), moneyInt >= 0 else { return }
        
        if let bank = bank {
            bank.title = bankName
            bank.balance = moneyInt
            bankVM.myBanks.append(bank)
        }
        inputMoney = ""
        bank = nil
    }
}
