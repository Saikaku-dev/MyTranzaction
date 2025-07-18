//
//  TodoView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import SwiftUI

struct TodoView: View {
    let loader = LoadBankList()
    var body: some View {
        Text("\(Date().onlyMonthString())月")
        
//        Picker("Select a month", selection: .constant("January")) {
//            Text("January").tag("January")
//            Text("February").tag("February")
//            Text("March").tag("March")
//        }
    }
    
    func load() {
        if let fileUrl = Bundle.main.url(forResource: "banklistAPI", withExtension: "csv") {
            print(fileUrl)
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
