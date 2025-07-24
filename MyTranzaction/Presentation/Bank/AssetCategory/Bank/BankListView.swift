//
//  BankListView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankListView: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: BankListViewModel
    @State var keyword: String = ""
    private let categories:[String] = ["銀行", "カード", "電子マネー"]
    
    init () {
        _vm = StateObject(wrappedValue: BankListViewModel(
            useCase: BankUseCase(bankRepository: BankRepoSwiftDataImpl()),
            user: MockUser.user))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Picker ("Category", selection: $vm.selectedIndex) {
                ForEach(categories.indices, id: \.self) { index in
                    Text(categories[index])
                }
            }
            .pickerStyle(.segmented)
            .padding(.vertical)
            .onChange(of: vm.selectedIndex) {
                keyword = ""
            }
            
            //SearchBar
            TextField("検索", text: $keyword)
                .padding(.vertical, 8)
                .padding(.horizontal, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 8)
                .ignoresSafeArea(.keyboard)
        }
        VStack {
            if vm.selectedIndex == 0 {
                listRowStyle(items: vm.filteredBanks(keyword)) { bankName in
                    vm.showAlert = true
                    vm.bankName = bankName
                }
            } else if vm.selectedIndex == 1 {
                listRowStyle(items: vm.filteredCards(keyword)) { item in
                    dismiss()
                }
            } else if vm.selectedIndex == 2 {
                listRowStyle(items: vm.filteredElectronicMoney(keyword)) { item in
                    dismiss()
                }
            } else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        //アラートで金額入力
        .alert(vm.bankName, isPresented: $vm.showAlert) {
            TextField("残高を入力してください", text: $vm.inputMoney)
                .keyboardType(.decimalPad)
            Button("OK") {
                vm.checking()
                dismiss()
            }
            Button("キャンセル", role: .cancel) {
                vm.inputMoney = ""
            }
        }
    }
    private func listRowStyle(
        items: [String],
        action: @escaping (String) -> Void
    ) -> some View {
        List {
            ForEach(items, id: \.self) { item in
                Button {
                    //　クリックしたitemをBankViewに渡す)
                    action(item)
                } label: {
                    HStack {
                        Text(item)
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

#Preview {
    BankListView()
}
