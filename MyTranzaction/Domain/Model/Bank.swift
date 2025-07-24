//
//  Bank.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

@Model
final class Bank {
    @Attribute(.unique) var id: String
    var title: String // 口座の名前
    var balance: Int // 口座毎の金額
    
    init(title: String, balance: Int) {
        self.id = UUID().uuidString
        self.title = title
        self.balance = balance
    }
}
