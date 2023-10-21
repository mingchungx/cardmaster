//
//  HomeView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCreditCardId: String = UUID().uuidString
    
    @ObservedObject private var vm: HomeViewModel = HomeViewModel()
 
    var body: some View {
        content
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            header
            recommendedCreditCards
        }
    }
    
    var header: some View {
        Text("Recommendations for you")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    var recommendedCreditCards: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 30) {
                ForEach(CreditCard.dummyRecommendedCreditCards) { creditCard in
                    CreditCardView(creditCard: creditCard)
                }
            }
        }
        .padding(.leading)
    }
}

#Preview {
    HomeView()
        .glassBackgroundEffect()
}
