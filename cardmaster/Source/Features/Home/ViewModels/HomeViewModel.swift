//
//  HomeViewModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var recommendations: [CreditCard] = []
    
    func fetchRecommendations() {
        self.recommendations.removeAll()
        for creditCard in CreditCard.dummyRecommendedCreditCards {
            self.recommendations.append(creditCard)
        }
    }
}
