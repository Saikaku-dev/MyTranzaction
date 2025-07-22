//
//  HomeViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var user: User = MockUser.user
    
    init() {
        user.asset.totalAssets = 999
    }
}
