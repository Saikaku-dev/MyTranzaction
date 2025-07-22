//
//  RootView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        if session.isLogin {
            MainTabView()
        } else {
            LoginView(vm: LoginViewModel(useCase: UserUseCase(userRepository: UserRepoSwiftDataImpl())))
        }
    }
}

#Preview {
    RootView()
}
