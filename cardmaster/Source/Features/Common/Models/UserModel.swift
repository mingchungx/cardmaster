//
//  UserModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import Foundation

enum Occupation {
    case student
    case earlyProfessional
    case midCareer
    case businessOwner
    case freelance
    case executive
    case unemployed
    
    func type() -> String {
        switch self {
        case .student:
            return "student"
        case .earlyProfessional:
            return "earlyProfessional"
        case .midCareer:
            return "midCareer"
        case .businessOwner:
            return "businessOwner"
        case .freelance:
            return "freelance"
        case .executive:
            return "executive"
        case .unemployed:
            return "unemployed"
        }
    }
}

enum CreditScore {
    case poor
    case fair
    case good
    case great
    case excellent
    
    func type() -> String {
        switch self {
        case .poor:
            return "poor"
        case .fair:
            return "fair"
        case .good:
            return "good"
        case .great:
            return "great"
        case .excellent:
            return "excellent"
        }
    }
}

struct User {
    var username: String
    var age: Int
    var occupation: Occupation
    var income: Int
    var creditScore: CreditScore
    var budget: Int
    var travelFrequency: Bool
    var travelInterest: Bool
}

extension User {
    // MARK: User.user only exists in one lifetype of the program
    
    static let user: User = User(
        username: "waterwaterwater.loolooloo",
        age: 18,
        occupation: .student,
        income: 10000,
        creditScore: .fair,
        budget: 200,
        travelFrequency: false,
        travelInterest: true
    )
}
