//
//  TodoView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import SwiftUI

struct TodoView: View {
    var body: some View {
        Text("\(Date().onlyMonthString())月")
        
        Picker("Select a month", selection: .constant("January")) {
            Text("January").tag("January")
            Text("February").tag("February")
            Text("March").tag("March")
        }
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
