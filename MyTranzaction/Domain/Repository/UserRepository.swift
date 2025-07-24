//
//  UserRepository.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation

protocol UserRepository {
    func fetchAllUsers() -> [User] // すでに作成済みのアカウントを表示するために
    func getUser(byAccount account: String) -> User?
    func saveUser(_ user: User) // ローカルにアカウントを作成
    func deleteUser(_ user: User) // 作成ずみのアカウントを削除
}
