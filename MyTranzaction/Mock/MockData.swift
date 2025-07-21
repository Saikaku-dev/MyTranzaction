//
//  MockData.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import Foundation

final class MockUser {
    static let user: User = User(
        account: "test@test.com",
        password: "password",
        asset: Assets(totalAssets: 0, liabilities: 0))
}

final class MockData {
    let totalAssets: Int = 100000 //総資産
    let liabilities: Int = 55555 //負債
    let income: Int = 7777 //収入
    let expenditure: Int = 33333 //支出
    
    func getBalance() -> Int {
        return income - expenditure
    }
}

final class MockBank {
    static let banks: [String] = ["ゆうちょ銀行", "みずほ銀行", "楽天銀行", "みらい銀行", "楽天銀行"]
    static let cards: [String] = ["楽天カード", "みずほカード", "ゆうちょカード", "楽天カード", "みらいカード"]
    static let electronicMoney: [String] = ["PayPal", "Apple Pay", "Google Pay", "iTunes Store", "Amazon Pay"]
}
