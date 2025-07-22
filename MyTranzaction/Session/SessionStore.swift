//
//  SessionStore.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import Foundation
import Combine
import SwiftData

final class SessionStore: ObservableObject {
    private static let userIdKey = "currentUserId"
    private static let loginKey = "isLogin"
    
    @Published var currentUser: User?
    @Published var isLogin: Bool {
        didSet {
            UserDefaults.standard.set(isLogin, forKey: Self.loginKey)
        }
    }
    
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.isLogin = UserDefaults.standard.bool(forKey: Self.loginKey)
        if let userId = UserDefaults.standard.string(forKey: Self.userIdKey),
           let user = SessionStore.fetchUser(with: userId, context: modelContext) {
            self.currentUser = user
            self.isLogin = true
        } else {
            self.currentUser = nil
            self.isLogin = false
            UserDefaults.standard.set(false, forKey: Self.loginKey)
            UserDefaults.standard.removeObject(forKey: Self.userIdKey)
        }
    }
    
    func loginSuccess(user: User) {
        self.currentUser = user
        if currentUser != nil {
            self.isLogin = true
            UserDefaults.standard.set(user.id, forKey: Self.userIdKey)
        }
    }
    
    func logout() {
        self.currentUser = nil
        self.isLogin = false
        UserDefaults.standard.removeObject(forKey: Self.userIdKey)
    }
    
    private static func fetchUser(with id: String, context: ModelContext) -> User? {
        let descriptor = FetchDescriptor<User>(predicate: #Predicate { $0.id == id })
        return try? context.fetch(descriptor).first
    }
}
