//
//  UserrepositoryImplLocal.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/21.
//

import Foundation
import SwiftData

final class UserRepoImplLocal: UserRepository {
    private let context: ModelContext
    
    init(context: ModelContext = SwiftDataManager.shared.modelContext) {
        self.context = context
    }
    
    func getAllAssets() -> Assets {
        let userDescriptor = FetchDescriptor<User>()
        guard let user = try? context.fetch(userDescriptor).first else {
            return Assets(totalAssets: 0, liabilities: 0)
        }
        return user.asset
    }
}
