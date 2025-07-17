//
//  BankView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankView: View {
    @State private var isShowBanks: Bool = false
    var body: some View {
        NavigationStack {
            ScrollView {
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
                
                // MARK: - 口座カード
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isShowBanks) {
                BankListView()
            }
        }
    }
}

#Preview {
    BankView()
}
