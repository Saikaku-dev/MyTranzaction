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
    var title: String
    var balance: Int
    @Relationship(inverse: \User.banks) var owner: User
    
    init(title: String, balance: Int, owner: User) {
        self.id = UUID().uuidString
        self.title = title
        self.balance = balance
        self.owner = owner
    }
}
