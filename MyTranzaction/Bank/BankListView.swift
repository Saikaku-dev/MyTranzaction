//
//  BankListView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct BankListView: View {
    var body: some View {
        List {
            ForEach(MockBank.banks, id: \.self) { bank in
                Button(bank) {
                    // 画面遷移
                    print("clicked \(bank)")
                }
            }
        }
    }
}

#Preview {
    BankListView()
}
