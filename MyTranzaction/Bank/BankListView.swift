//
//  BankListView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankListView: View {
    private let categories:[String] = ["銀行", "カード", "電子マネー"]
    @State private var selectedIndex: Int = 0
    @State private var selectedBank = MockBank.banks[0]
    @State private var selectedCard = MockBank.cards[0]
    @State private var selectedPayment = MockBank.electronicMoney[0]
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: BankViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Picker ("Category", selection: $selectedIndex) {
                    ForEach(categories.indices, id: \.self) { index in
                        Text(categories[index])
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical)
                
                if selectedIndex == 0 {
                    listRowStyle(title: "おすすめの銀行", items: MockBank.banks) { item in
                        vm.myBanks.append(item)
                        dismiss()
                    }
                } else if selectedIndex == 1 {
                    listRowStyle(title: "おすすめのカード", items: MockBank.cards) { item in
                        vm.myCards.append(item)
                        dismiss()
                    }
                } else if selectedIndex == 2 {
                    listRowStyle(title: "おすすめのマネー", items: MockBank.electronicMoney) { item in
                        vm.myMonies.append(item)
                        dismiss()
                    }
                } else {
                    ProgressView()
                }
            }
        }
    }
    private func listRowStyle(
        title: String,
        items: [String],
        action: @escaping (String) -> Void
    ) -> some View {
        List {
            Text(title)
                .fontWeight(.bold)
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
