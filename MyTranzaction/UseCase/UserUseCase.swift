//
//  UserUseCase.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/22.
//

import Foundation

class UserUseCase {
    private let userRepository: UserRepository
    
    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }
    
    func createUser(_ user: User) { //アカウント作成
        userRepository.saveUser(user)
    }
    
    func getUser(account: String) -> User? {
        userRepository.getUser(byAccount: account)
    }
    
    func fetchAllUsers() -> [User] {
        userRepository.fetchAllUsers()
    }
    
    func deleteUser(_ user: User) {
        userRepository.deleteUser(user)
    }
}
