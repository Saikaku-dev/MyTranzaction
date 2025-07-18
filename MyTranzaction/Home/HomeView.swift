//
//  HomeView.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import SwiftUI

struct HomeView: View {
    let mock = MockData() //Mockデータ
    
    var body: some View {
        VStack {
            // MARK: - HEADBAR
            // fetch機能とお知らせ・設定
            HStack {
                Image(systemName: "arrow.trianglehead.2.clockwise.rotate.90") // FetchAll
                Spacer()
                Image(systemName: "bell") //設定による支払いのお知らせ
                    .padding(.trailing)
                Image(systemName: "gearshape") //User設定
                    .onTapGesture {
                        print("Clicked gear") //TODO: ユーザーカスタマイズ
                    }
            }
            .foregroundColor(.cyan)
            .font(.system(size: 24))
            .padding(.horizontal)
            
            GeometryReader { geometry in
                ScrollView {
                    // MARK: - HEADER 総資産・マイナス資産
                    VStack(alignment: .leading) {
                        HStack {
                            Text("資産合計")
                            Spacer()
                            Text("\(mock.totalAssets)円")
                        }
                        Rectangle()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        HStack { //マイナス資産
                            Text("負債")
                            Spacer()
                            Text("\(mock.liabilities)円") //自分の負債額
                        }
                    }
                    .homeViewTitleFont()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .mainColor()
                    
                    // MARK: - BODY (収入・支出)を具体的な月分を表示
                    VStack {
                        HStack { // タイトル
                            Image(systemName: "star.fill")
                                .foregroundColor(.cyan)
                            Text("家計簿")
                            Text("\(Date().monthToString())")
                            Spacer()
                        }
                        .padding(.leading)
                        
                        HStack {
                            // グラフで表示する収支
                            ZStack {
                                Circle()
                                    .frame(width: 150)
                                Circle()
                                    .fill(.white)
                                    .frame(width: 65)
                            }
                            .padding(.trailing)
                            
                            VStack(alignment: .leading) {
                                // 収支データ
                                smartBalanceRow(label: "収入", value: mock.income)
                                smartBalanceRow(label: "支出", value: mock.expenditure)
                                Divider()
                                smartBalanceRow(label: "収支", value: mock.getBalance())
                            }
                            .font(.title3)
                            .foregroundColor(.gray)
                        }
                        .padding()
                    }
                    .padding(.vertical)
                    .background(.white)
                    .cornerRadius(8)
                    .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemGray6))
        }
    }
    
    @ViewBuilder
    func smartBalanceRow(label: String, value: Any) -> some View {
        HStack {
            Text(label)
            Spacer()
            if let intVal = value as? Int {
                Text("\(intVal)")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.black)
                Text("円")
            } else if let strVal = value as? String {
                Text(strVal)
            } else {
                Text("-")
            }
        }
    }
}

extension View {
    func homeViewTitleFont() -> some View {
        self
            .foregroundColor(.white)
            .font(.system(size: 24, weight: .bold))
    }
}

extension Date {
    func monthToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月"
        return formatter.string(from: self)
    }
}

#Preview {
    HomeView()
}
