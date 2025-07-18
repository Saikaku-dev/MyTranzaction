//
//  TodoView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        //テスト
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

#Preview {
    MainTabView()
}
