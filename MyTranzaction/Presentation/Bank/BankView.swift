//
//  BankView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankView: View {
    @EnvironmentObject var session: SessionStore
    @StateObject private var vm: BankViewModel
    
    @State private var isShowBanks: Bool = false
    
    init(user: User) {
        _vm = StateObject(wrappedValue: BankViewModel(
            useCase: BankUseCase(bankRepository: BankRepoSwiftDataImpl()),
            user: user))
    }
    
    var body: some View {
        NavigationStack {
            Button(action: {
                // 口座を登録する処理
                isShowBanks = true
            }) {
                Text("口座・資産を連結・登録する")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .mainColor()
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            
            ScrollView {
                // MARK: - 口座カード
                VStack(alignment: .leading) {
                    
                    if !vm.myBanks.isEmpty {
                        Text("銀行")
                        ForEach(vm.myBanks, id: \.self) { bank in
                            bankCard(name: bank.title, balance: String(bank.balance))
                                .onTapGesture {
                                    vm.deleteBank(bank) //TODO: 削除gestureを変更
                                }
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isShowBanks) {
                if let user = session.currentUser {
                    BankListView(user: user)
                }
            }
            .onAppear() {
                vm.fetchBanks()
            }
        }
    }
    private func bankCard(name: String, balance: String) -> some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
            HStack(alignment: .bottom) {
                Spacer()
                Text(balance)
                    .font(.title3)
                Text("円")
            }
            .foregroundColor(.white)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(Color.gray)
        .cornerRadius(8)
    }
}

#Preview {
    BankView(user: MockUser.user)
}
