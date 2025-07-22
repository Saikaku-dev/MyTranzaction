//
//  User.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: String
    var account: String
    var password: String
    @Relationship var banks: [Bank] = []
    
    var totalAsset: Int {
        banks.reduce(0) { $0 + $1.balance}
    }
    
    init(account: String, password: String) {
        self.id = UUID().uuidString
        self.account = account
        self.password = password
    }
}
