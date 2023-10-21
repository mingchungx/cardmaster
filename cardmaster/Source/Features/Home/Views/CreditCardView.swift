//
//  CreditCardView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import SwiftUI

struct CreditCardView: View {
    var creditCard: CreditCard
    
    var body: some View {
        content
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Image(creditCard.image)
                .resizable()
                .scaledToFit()
                .frame(width: 400)
                .hoverEffect(.automatic)
            Text(creditCard.cardName)
                .font(.largeTitle)
            Text("Recommended by \(creditCard.who)")
                .foregroundStyle(Color.white)
                .opacity(0.6)
            tags
            specialOffer
            HStack {
                applyButton
                addToWishlistButton
            }
        }
        .padding()
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 20)
        )
    }
    
    var tags: some View {
        HStack {
            ForEach(creditCard.tags, id: \.self) { tag in
                Group {
                    if (!tag.type()) {
                        Group {
                            HStack {
                                Image(systemName: tagSystemImage(tag: tag))
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 20)
                                    .foregroundStyle(Color.black)
                                Text(tagStringConverter(tag: tag))
                                    .font(.caption2)
                                    .foregroundStyle(Color.black)
                                    .padding(.trailing, 5)
                            }
                        }
                        .padding(7)
                        .background(
                            Color.white,
                            in: RoundedRectangle(cornerRadius: 20)
                        )
                    }
                }
            }
        }
    }
    
    var specialOffer: some View {
        HStack {
            Image(systemName: "star.fill")
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.white)
            Text(creditCard.specialOffers)
                .font(.caption2)
                .lineLimit(nil) // Set lineLimit to nil to allow unlimited lines
                .frame(maxWidth: 300) // Set the maximum width for the text
        }
        .padding()
    }
    
    var applyButton: some View {
        HStack {
            Text("Learn More")
                .foregroundStyle(Color.white)
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.white)
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.orange, Color.red]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .onTapGesture {
            
        }
    }
    
    var addToWishlistButton: some View {
        HStack {
            Text("Add to Wishlist")
                .foregroundStyle(Color.white)
            Image(systemName: "heart")
                .foregroundStyle(Color.white)
        }
        .padding()
        .background(
            .thinMaterial
        )
        .onTapGesture {
            
        }
    }
}

extension CreditCardView {
    func tagSystemImage(tag: Tag) -> String {
        switch(tag) {
        case .travel(_):
            return "airplane"
        case .business(_):
            return "suitcase.fill"
        case .cashback(_):
            return "dollarsign.circle.fill"
        case .elite(_):
            return "sparkles"
        case .store(_):
            return "cart.fill"
        case .student(_):
            return "graduationcap.fill"
        }
    }
    
    func tagStringConverter(tag: Tag) -> String {
        switch(tag) {
        case .travel(_):
            return "Travel"
        case .business(_):
            return "Business"
        case .cashback(_):
            return "Cash Back"
        case .elite(_):
            return "Elite"
        case .store(_):
            return "Store"
        case .student(_):
            return "Student"
        }
    }
}

#Preview {
    CreditCardView(creditCard: CreditCard.dummyRecommendedCreditCards[0])
        .glassBackgroundEffect()
}
