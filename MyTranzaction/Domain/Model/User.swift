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
    let id: String
    var account: String
    var password: String
    var asset: Assets
    
    init(account: String, password: String, asset: Assets) {
        self.id = UUID().uuidString
        self.account = account
        self.password = password
        self.asset = asset
    }
}
