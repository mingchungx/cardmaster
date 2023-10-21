//
//  CreditCardView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import SwiftUI

struct CreditCardView: View {
    var creditCard: CreditCard
    
    @State private var showImmersiveSpace: Bool = false
    @State private var immersiveSpaceIsShown: Bool = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        content
            .onChange(of: showImmersiveSpace) { _, newValue in
                Task {
                    if newValue {
                        switch await openImmersiveSpace(id: "ImmersiveSpace") {
                        case .opened:
                            immersiveSpaceIsShown = true
                        case .error, .userCancelled:
                            fallthrough
                        @unknown default:
                            immersiveSpaceIsShown = false
                            showImmersiveSpace = false
                        }
                    } else if immersiveSpaceIsShown {
                        await dismissImmersiveSpace()
                        immersiveSpaceIsShown = false
                    }
                }
            }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            Group {
                if !showImmersiveSpace {
                    Image(creditCard.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .hoverEffect(.automatic)
                } else {
                    Button {
                        showImmersiveSpace = false
                    } label: {
                        Text("Back")
                    }
                }
            }
            Text(creditCard.cardName)
                .font(.largeTitle)
            Text("Recommended by \(creditCard.who)")
                .foregroundStyle(Color.white)
                .opacity(0.6)
            tags
            Group {
                if showImmersiveSpace {
                    Text(creditCard.description)
                        .padding(.top)
                        .font(.caption2)
                        .frame(maxWidth: 400)
                }
            }
            specialOffer
            HStack {
                applyButton
                addToWishlistButton
            }
        }
        .scaledToFit()
        .frame(width: 500, height: 550)
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
                                    .foregroundStyle(Color.white)
                                Text(tagStringConverter(tag: tag))
                                    .font(.caption2)
                                    .foregroundStyle(Color.white)
                                    .padding(.trailing, 5)
                            }
                        }
                        .padding(7)
                        .background(
                            .ultraThinMaterial,
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
                .lineLimit(nil)
                .frame(maxWidth: 300)
        }
        .padding()
    }
    
    var applyButton: some View {
        HStack {
            Text(showImmersiveSpace ? "Apply" : "Learn More")
                .foregroundStyle(Color.black)
            Image(systemName: showImmersiveSpace ? "link" : "chevron.right")
                .foregroundStyle(Color.black)
        }
        .padding()
        .background(
            Color.white
        )
        .onTapGesture {
            CreditCard.immersionState = creditCard.immersive
            if showImmersiveSpace {
                openURLInSafari(urlString: creditCard.signupLink)
            }
            showImmersiveSpace = true
        }
    }
    
    var addToWishlistButton: some View {
        HStack {
            Text(creditCard.wishlisted ? "Remove from Wishlist" : "Add to Wishlist")
                .foregroundStyle(Color.white)
            Image(systemName: "heart")
                .foregroundStyle(Color.white)
        }
        .padding()
        .background(
            .thinMaterial
        )
        .onTapGesture {
            CreditCard.toggleWishlist(for: creditCard.id)
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
    
    func openURLInSafari(urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    CreditCardView(creditCard: CreditCard.dummyRecommendedCreditCards[0])
        .glassBackgroundEffect()
}
