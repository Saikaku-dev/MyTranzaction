//
//  User.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import SwiftData

@Model
final class Assets {
    var totalAssets: Int
    var liabilities: Int
    
    init (totalAssets: Int, liabilities: Int) {
        self.totalAssets = totalAssets
        self.liabilities = liabilities
    }
}
