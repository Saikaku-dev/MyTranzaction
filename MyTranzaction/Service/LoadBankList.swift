//
//  LoadBankList.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation

class LoadBankList {
    func load() -> [String] {
        var banks: [String] = []
        if let fileUrl = Bundle.main.url(forResource: "bank_list", withExtension: "csv") {
            do {
                // ファイルを読み込み
                let content = try String(contentsOf: fileUrl, encoding: .utf8)
                // 行ごと分離
                let rows = content.components(separatedBy: .newlines)
                for row in rows {
                    let columns = row.components(separatedBy: ",")
                    if let first = columns.first, !first.isEmpty {
                        banks.append(first)
                    }
                }
            } catch {
                print("読み込みエラー:", error)
            }
        } else {
            print("ファイルが見つかりません")
        }
        return banks
    }
}
