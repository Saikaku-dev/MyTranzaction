//
//  HomeViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    var user: User?
    
    init(user: User) {
        self.user = MockUser.user
//        user.asset.totalAssets =
    }
}
