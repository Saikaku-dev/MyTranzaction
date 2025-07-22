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
    
    init (useCase: UserUseCase) {
        self.useCase = useCase
    }
    
    func createAccount() -> Bool {
        guard !account.isEmpty, !password.isEmpty else { return false }
        // TODO: 正しいAssetsに置き換え
        let asset = Assets(totalAssets: 0, liabilities: 0)
        // TODO: アカウント作成ルールを追加
        let user = User(account: account, password: password, asset: asset)
        useCase.createUser(user)
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
            } else {
                vm.showErrorMessage = true
            }
        }
        
        if vm.showErrorMessage {
            Text("作成失敗")
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

#Preview {
    SignupView()
}
