//
//  BankViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

final class BankViewModel: ObservableObject {
    @Published var myBanks: [String] = []
    @Published var myCards: [String] = []
    @Published var myMonies: [String] = []
}
