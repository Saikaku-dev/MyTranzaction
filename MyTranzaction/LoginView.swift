//
//  LoginView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    var currentUser: User?
    @Published var account: String = ""
    @Published var passoword: String = ""
    var session: SessionStore
    
    init(session: SessionStore) {
        self.session = session
    }
    
    func login() {
        currentUser = MockUser.user
        if let user = currentUser {
            account = user.account
            passoword = user.password
            session.isLogin = true
        } else {
            print("ログインエラー: ユーザー情報取得に失敗しました")
        }
    }
}

struct LoginView: View {
    @StateObject var vm: LoginViewModel
    var body: some View {
        VStack {
            TextField("account", text: $vm.account)
            Divider()
            TextField("password", text:$vm.passoword)
            Divider()
            Button("Login") {
                vm.login()
            }
            .padding()
        }
        .ignoresSafeArea(.keyboard)
        .fullScreenCover(isPresented: $vm.session.isLogin) {
            MainTabView()
        }
    }
}

#Preview {
    LoginView(vm: LoginViewModel(session: SessionStore()))
}
