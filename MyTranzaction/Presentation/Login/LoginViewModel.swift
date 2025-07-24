//
//  LoginViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/22.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var account: String = ""
    @Published var password: String = ""
    @Published var showErrorMessage: Bool = false
    @Published var errorMessage: String = ""
    @Published var allUsers: [User] = []
    
    private var useCase: UserUseCase
    
    init(useCase: UserUseCase) {
        self.useCase = useCase
        fetchAllUsers()
    }
    
    func login(session: SessionStore) {
        guard !account.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            showErrorMessage = true
            errorMessage = "アカウントかパスワードが未入力です"
            return
        }
        
        if let user = useCase.getUser(account: account), user.password == password {
            session.loginSuccess(user: user)
            // エラーメッセージを初期化
            showErrorMessage = false
            errorMessage = ""
        } else {
            showErrorMessage = true
            errorMessage = "情報が一致していません"
            session.currentUser = nil
        }
    }
    
    func fetchAllUsers() {
        allUsers = useCase.fetchAllUsers()
    }
    
    func deleteUser(_ user: User) {
        useCase.deleteUser(user)
        fetchAllUsers()
    }
}
