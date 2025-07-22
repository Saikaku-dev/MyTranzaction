//
//  LoginView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewModel(
        useCase: UserUseCase(userRepository: UserRepoSwiftDataImpl()))
    @EnvironmentObject var session: SessionStore
    @State private var showSignup: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                TextField("account", text: $vm.account)
                Divider()
                TextField("password", text:$vm.password)
                Divider()
                
                if vm.showErrorMessage {
                    Text(vm.errorMessage)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                HStack {
                    Button("Signup") {
                        showSignup = true
                    }
                    
                    Button("Login") {
                        vm.login(session: session)
                    }
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard)
            .fullScreenCover(isPresented: $session.isLogin) {
                MainTabView()
            }
            .navigationDestination(isPresented: $showSignup) {
                SignupView()
            }
        }
    }
}

#Preview {
    LoginView(vm: LoginViewModel(
        useCase: UserUseCase(userRepository: UserRepoSwiftDataImpl())))
}
