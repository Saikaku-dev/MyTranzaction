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
    
    private var useCase: UserUseCase
    
    init(useCase: UserUseCase) {
        self.useCase = useCase
    }
    
    func login(session: SessionStore) {
        autoInput()
        guard !account.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            showErrorMessage = true
            errorMessage = "入力内容が未入力です"
            return
        }
        if let user = useCase.getUser(account: account, password: password) {
            session.loginSuccess(user: user)
            showErrorMessage = false
            errorMessage = ""
        } else {
            showErrorMessage = true
            errorMessage = "情報が一致していません"
            session.currentUser = nil
        }
    }
    // テスト
    func autoInput() {
        account = MockUser.user.account
        password = MockUser.user.password
    }
}
