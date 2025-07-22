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
    let id: String
    var title: String
    var balance: Int
    
    init(title: String, balance: Int) {
        self.id = UUID().uuidString
        self.title = title
        self.balance = balance
    }
}
