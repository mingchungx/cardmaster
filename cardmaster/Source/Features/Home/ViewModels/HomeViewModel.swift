//
//  HomeViewModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation
import Alamofire

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var recommendations: [CreditCard] = []
    
    func fetchRecommendations() async {
        let endpoint: URLConvertible = "http://127.0.0.1:8000/api/recommend"
        let parameters: Parameters = [
            "occupation": User.user.occupation.type(),
            "travelFrequency": User.user.travelFrequency ? "true" : "false",
            "travelInterest": User.user.travelInterest ? "true" : "false",
            "creditScore": User.user.creditScore,
            "income": User.user.income,
            "budget": User.user.budget
        ]
        
        AF.request(endpoint, parameters: parameters).responseData { response in
            switch response.result {
            case .success(let data):
                self.recommendations.removeAll()
                CreditCard.recommendedCreditCards.removeAll()
                
                if let json = try? JSONSerialization.jsonObject(with: data, options: []), let jsonDict = json as? [String: Any] {
                    let first = jsonDict["0"] as? [String: Any]
                    let second = jsonDict["1"] as? [String: Any]
                    let third = jsonDict["2"] as? [String: Any]
                    let fourth = jsonDict["3"] as? [String: Any]
                    let fifth = jsonDict["4"] as? [String: Any]
                    
                    let data: [[String: Any]?] = [first, second, third, fourth, fifth]

                    for creditCard in data {
                        if let creditCard = creditCard {
                            let id = creditCard["ID"] as? String
                            let apr = creditCard["APR"] as? String
                            let who = creditCard["who"] as? String
                            let annualFee = creditCard["annual_fee"] as? String
                            let cardName = creditCard["card_name"] as? String
                            let creditRange = creditCard["credit_range"] as? String
                            let description = creditCard["description"] as? String
                            let image = creditCard["image"] as? String
                            let immersive = creditCard["immersive"] as? String
                            let offeringInstitution = creditCard["offering_institution"] as? String
                            let signupLink = creditCard["signup_link"] as? String
                            let specialOffers = creditCard["special_offers"] as? String
                            let tags = creditCard["tag"] as? [String: Any]
                            let wishlisted: Bool = false
                            
                            if let tags = tags {
                                // Parsing tags
                                let business = tags["business"] as? Bool
                                let cashback = tags["cash_back"] as? Bool
                                let elite = tags["elite"] as? Bool
                                let store = tags["store"] as? Bool
                                let student = tags["student"] as? Bool
                                let travel = tags["travels"] as? Bool
                                
                                let parsedCreditCard: CreditCard = CreditCard(
                                    id: id ?? UUID().uuidString,
                                    apr: apr ?? "",
                                    who: who ?? "",
                                    annualFee: annualFee ?? "",
                                    cardName: cardName ?? "",
                                    creditRange: creditRange ?? "",
                                    description: description ?? "",
                                    image: image ?? "",
                                    immersive: immersive ?? "",
                                    offeringInstitution: offeringInstitution ?? "",
                                    signupLink: signupLink ?? "",
                                    specialOffers: specialOffers ?? "",
                                    tags: [
                                        .business(!(business ?? true)),
                                        .cashback(!(cashback ?? true)),
                                        .elite(!(elite ?? true)),
                                        .store(!(store ?? true)),
                                        .student(!(student ?? true)),
                                        .travel(!(travel ?? true))
                                    ],
                                    wishlisted: wishlisted
                                )
                                
                                CreditCard.recommendedCreditCards.append(parsedCreditCard)
                            }
                        }
                    }
                    for creditCard in CreditCard.recommendedCreditCards {
                        self.recommendations.append(creditCard)
                    }
                } else {
                    debugPrint("Failed")
                }
            case .failure(_):
                debugPrint("Failed")
            }
        }
    }
}
