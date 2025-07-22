//
//  UserRepository.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation

protocol UserRepository {
    func getUser(account: String, password: String) -> User?
    func saveUser(_ user: User)
    func fetchAllUsers() -> [User]
    func deleteUser(_ user: User)
}
