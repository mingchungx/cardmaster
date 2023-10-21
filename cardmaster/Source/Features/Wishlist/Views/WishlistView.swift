//
//  WishlistView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import SwiftUI

struct WishlistView: View {
    @State private var selectedCreditCardId: String = UUID().uuidString
    
    @ObservedObject private var vm: WishlistViewModel = WishlistViewModel()
 
    var body: some View {
        content
            .onAppear {
                vm.fetchWishlist()
            }
    }
    
    var content: some View {
        Group {
            if vm.wishlist.isEmpty {
                Text("Your wishlist is empty!")
            } else {
                VStack(alignment: .leading) {
                    header
                    recommendedCreditCards
                }
            }
        }
    }
    
    var header: some View {
        Text("Your Wishlist")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    var recommendedCreditCards: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(vm.wishlist) { creditCard in
                    CreditCardView(creditCard: creditCard)
                }
            }
        }
        .padding(.leading)
    }
}

#Preview {
    WishlistView()
        .glassBackgroundEffect()
}
