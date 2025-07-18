//
//  BankListView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankListView: View {
    private let categories:[String] = ["銀行", "カード", "電子マネー"]
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = BankListViewModel()
    @EnvironmentObject var bankVM: BankViewModel
    @State var keyword: String = ""
    
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
                listRowStyle(items: vm.filteredBanks(keyword)) { item in
                    bankVM.myBanks.append(item)
                    dismiss()
                }
            } else if vm.selectedIndex == 1 {
                listRowStyle(items: vm.filteredCards(keyword)) { item in
                    bankVM.myCards.append(item)
                    dismiss()
                }
            } else if vm.selectedIndex == 2 {
                listRowStyle(items: vm.filteredElectronicMoney(keyword)) { item in
                    bankVM.myMonies.append(item)
                    dismiss()
                }
            } else {
                ProgressView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        .environmentObject(BankViewModel())
}
