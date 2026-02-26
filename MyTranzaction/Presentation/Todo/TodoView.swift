//
//  TodoView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        VStack {
            Text("TODO機能")
                .font(.title)
            Text("開発中...")
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

extension Date {
    func onlyMonthString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM"
        return dateFormatter.string(from: self)
    }
}

#Preview {
    TodoView()
}
