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
    
    func getUser(account: String, password: String) -> User? {
        return userRepository.getUser(account: account, password: password)
    }
    
    func createUser(_ user: User) {
        userRepository.saveUser(user)
    }
}
