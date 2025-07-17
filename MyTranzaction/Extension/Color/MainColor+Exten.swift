//
//  MainColor+Exten.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/17.
//

import Foundation
import SwiftUI

extension View {
    func mainColor() -> some View {
        self
            .background(
                LinearGradient(
                    colors: [.cyan, .green],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
            )
    }
}
