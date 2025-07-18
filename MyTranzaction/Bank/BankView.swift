//
//  BankView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankView: View {
    @State private var isShowBanks: Bool = false
    @EnvironmentObject var vm: BankViewModel
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
                        }
                    }
                    
                    if !vm.myCards.isEmpty {
                        Text("カード")
                        ForEach(vm.myCards, id: \.self) { card in
                            bankCard(name: card, balance: "0円")
                        }
                    }
                    
                    if !vm.myMonies.isEmpty {
                        Text("電子マネー")
                        ForEach(vm.myMonies, id: \.self) { money in
                            bankCard(name: money, balance: "0円")
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isShowBanks) {
                BankListView()
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
    BankView()
        .environmentObject(BankViewModel(repository: BankRepoImplLocal()))
}
