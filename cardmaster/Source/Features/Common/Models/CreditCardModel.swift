//
//  CreditCardModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation

enum Tag: Hashable {
    case business(Bool)
    case cashback(Bool)
    case elite(Bool)
    case store(Bool)
    case student(Bool)
    case travel(Bool)
    
    func type() -> Bool {
        switch self {
        case .business(let bool): 
            return bool
        case .cashback(let bool): 
            return bool
        case .elite(let bool): 
            return bool
        case .store(let bool):
            return bool
        case .student(let bool):
            return bool
        case .travel(let bool):
            return bool
        }
    }
}

struct CreditCard: Identifiable {
    var id: String
    var apr: String
    var who: String
    var annualFee: String
    var cardName: String
    var creditRange: String
    var description: String
    var image: String // Should be one of those found in assets
    var immsersive: String // Should be one of those found in assets
    var offeringInstitution: String
    var signupLink: String // Should be able to be used as a URL
    var specialOffers: String
    var tags: [Tag]
    var wishlisted: Bool = false
}

extension CreditCard {
    static let recommendedCreditCards: [CreditCard] = {[]}()
    
    #warning("images and immersive filenames must match")
    static let dummyRecommendedCreditCards: [CreditCard] = {
        [CreditCard(id: "3a513eca-1b9d-4377-afc5-7efca9986879", apr: "21.74% - 28.74%", who: "cardmaster", annualFee: "$0 intro annual fee for the first year, then $99", cardName: "United Business Card", creditRange: "670-850", description: "The United℠ Business Card is an airline cobranded business travel card. It’s designed for businesses that frequently fly with United Airlines. With this card, you will earn 2 miles per dollar with United and at restaurants, gas stations, office supply stores, and on local transit and commuting. All other purchases earn 1 mile per dollar. With the United℠ Business Card, you'll earn 75,000 bonus points after you spend $5,000 on purchases in the first 3 months your account is open. Plus, $0 introductory annual fee for the first year, then $99.", image: "Cart Gradient 2", immsersive: "office.jpg", offeringInstitution: "Chase Bank", signupLink: "https://www.theexplorercard.com/business-rewards-cards?CELL=H8X&AFFID=fHUfpvpiSTw-Cfgog9xYl_NBs5SJjKh31w", specialOffers: "With the United℠ Business Card, you'll earn 75,000 bonus points after you spend $5,000 on purchases in the first 3 months your account is open. Plus, $0 introductory annual fee for the first year, then $99.", tags: [.business(true), .cashback(true), .elite(false), .store(false), .student(false), .travel(true)]),
         CreditCard(id: "a882aa0e-730b-4fcb-abf7-36a82a91008b", apr: "18.24% - 27.24%", who: "cardmaster", annualFee: "$0", cardName: "Discover it Student Chrome", creditRange: "580-740", description: "Discover it® Student Chrome is tailored for college students aiming to build credit while earning cash back. It provides 2% cash back on the first $1,000 spent in combined purchases at gas stations and restaurants each quarter. All other purchases earn 1% cash back. An unlimited cashback match is offered at the end of the first year, doubling the cash back earned.", image: "Cart Holograma 7", immsersive: "student.jpg", offeringInstitution: "Discover", signupLink: "https://www.discovercard.com/application/website/apply?srcCde=RJRM&ICMPGN=ALL_CC_STUDENT_CHROME_APPLY_NOW_BTN", specialOffers: "Unlimited Cashback Match at the end of the first year. No annual fee, 0% Intro APR for 6 months on purchases.", tags: [.business(false), .cashback(true), .elite(false), .store(false), .student(true), .travel(false)]),
         CreditCard(id: "286b011b-31e3-4e7a-9cdf-72770277798f", apr: "22.49% - 29.49%", who: "cardmaster", annualFee: "$95", cardName: "Chase Sapphire Preferred", creditRange: "670-850", description: "The Chase Sapphire Preferred® Card is a popular travel rewards card – and for good reason. It offers bonus rewards for travel and dining, with options for redeeming points at an outsized value. New cardholders can earn a sign-up bonus of 60,000 points after you spend $4,000 on purchases in the first 3 months from account opening. That's $750 when you redeem through Chase Ultimate Rewards®, making it a great card for kick-starting travel rewards. Add in card benefits such as purchase protection and trip cancellation/interruption insurance, and the Chase Sapphire Preferred® Card is a well-rounded travel card with a reasonable annual fee.", image: "Cart Minimal 3", immsersive: "beach.jpg", offeringInstitution: "Chase Bank", signupLink: "https://creditcards.chase.com/a1/23Q3a/sapphirepreferred/compare?CELL=6H8X&AFFID=fHUfpvpiSTw-pKUTpFFnPf9TdbuDy9VO8Q&pvid=d58f73aa9530b5404369bcb3ea5c1b0f&jp_cmp=cc/1393630/aff/15-31715/na", specialOffers: "New cardholders can earn a sign-up bonus of 60,000 points after you spend $4,000 on purchases in the first 3 months from account opening", tags: [.business(false), .cashback(false), .elite(true), .store(false), .student(false), .travel(true)])
        ]
    }()
}
