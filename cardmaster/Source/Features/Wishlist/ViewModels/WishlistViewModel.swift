//
//  WishlistViewModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation

@MainActor
final class WishlistViewModel: ObservableObject {
    @Published var wishlist: [CreditCard] = []
    
    func fetchWishlist() {
        self.wishlist.removeAll()
        for creditCard in CreditCard.dummyRecommendedCreditCards {
            if creditCard.wishlisted {
                self.wishlist.append(creditCard)
            }
        }
    }
}
