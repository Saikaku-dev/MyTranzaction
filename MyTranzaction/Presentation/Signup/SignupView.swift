//
//  SignUpView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/22.
//

import SwiftUI
import Combine

class SignupViewModel: ObservableObject {
    @Published var account: String = ""
    @Published var password: String = ""
    private var useCase: UserUseCase
    @Published var showErrorMessage: Bool = false
    @Published var errorMessage: String = ""
    
    init (useCase: UserUseCase) {
        self.useCase = useCase
    }
    
    func createAccount() -> Bool {
        guard !account.isEmpty, !password.isEmpty else {
            errorMessage = "アカウント名とパスワードを入力してください"
            showErrorMessage = true
            return false
        }
        
        if useCase.getUser(account: account, password: password) != nil {
            errorMessage = "このアカウントは既に存在します"
            showErrorMessage = true
            return false
        }
        // TODO: アカウント作成ルールを追加
        let user = User(account: account, password: password)
        useCase.createUser(user)
        showErrorMessage = false
        errorMessage = ""
        return true
    }
}

struct SignupView: View {
    @StateObject var vm = SignupViewModel(
        useCase: UserUseCase(userRepository: UserRepoSwiftDataImpl()))
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        TextField("account", text: $vm.account)
        Divider()
        TextField("password", text:$vm.password)
        Divider()
        
        Button("Create") {
            if vm.createAccount() {
                dismiss()
            }
        }
        
        if vm.showErrorMessage {
            Text(vm.errorMessage)
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

#Preview {
    SignupView()
}
