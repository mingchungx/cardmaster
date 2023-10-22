//
//  HomeView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI

struct HomeView: View {
    @State private var loading: Bool = false
    @State private var selectedCreditCardId: String = UUID().uuidString
    
    @ObservedObject private var vm: HomeViewModel = HomeViewModel()
 
    var body: some View {
        content
            .onAppear {
                Task {
                    loading.toggle()
                    await updateView()
                    loading.toggle()
                }
            }
            .overlay(
                Group {
                    if loading {
                        ProgressView()
                    }
                }
            )
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
                ForEach(vm.recommendations) { creditCard in
                    CreditCardView(creditCard: creditCard)
                }
            }
        }
        .padding(.leading)
    }
    
    func updateView() async {
        await vm.fetchRecommendations()
    }
}

#Preview {
    HomeView()
        .glassBackgroundEffect()
}
