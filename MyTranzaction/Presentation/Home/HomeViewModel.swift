//
//  HomeViewModel.swift
//  MyTranzaction
//
//  Created by cmStudent on 2025/07/18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    let useCase: UserUseCase
    
    init(useCase: UserUseCase) {
        self.useCase = useCase
    }
}
