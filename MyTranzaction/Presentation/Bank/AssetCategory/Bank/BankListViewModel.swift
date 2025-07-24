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
    
    private let useCase: BankUseCase
    private let user: User
    
    init(useCase: BankUseCase, user: User) {
        self.useCase = useCase
        self.user = user
        self.banks = loader.load()
        self.myCards = MockBank.cards
        self.myElectronicMoney = MockBank.electronicMoney
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
    
    func checking() {
        guard let moneyInt = Int(inputMoney),
              moneyInt >= 0 else {return}
        let newBank = Bank(title: bankName, balance: moneyInt)
        addBank(newBank)
        inputMoney = ""
    }
    
    func addBank(_ bank: Bank) {
        useCase.addBank(bank, to: user)
    }
}
