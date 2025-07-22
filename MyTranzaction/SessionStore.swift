//
//  SessionStore.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import Foundation
import Combine

final class SessionStore: ObservableObject {
    @Published var isLogin: Bool {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: "isLogin")
        }
    }
    
    init() {
        self.isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    }
}
