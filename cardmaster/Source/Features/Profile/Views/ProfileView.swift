//
//  ProfileView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @State private var username: String = "im_a_rich_tabby_42"
    @State private var occupation: Occupation = .student
    @State private var income: Int = 50000
    @State private var creditScore: CreditScore = .fair
    @State private var budget: Int = 200
    @State private var travelFrequency: Bool = false
    @State private var travelInterest: Bool = true
    
    let occupations: [String] = ["Student", "Early Professional", "Mid Career", "Business Owner", "Freelance", "Executive", "Unemployed"]
    @State private var selectedOccupationIndex: Int = 0
    
    let incomes: [Int] = [0, 10000, 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000, 150000, 250000, 500000, 1000000]
    @State private var selectedIncomeIndex: Int = 0
    
    let creditScores: [CreditScore] = [.poor, .fair, .good, .great, .excellent]
    @State private var selectedCreditScoreIndex: Int = 0
    
    @State private var budgetInput: String = "200"
    
    let booleans: [String] = ["Yes", "No"]
    @State private var selectedTravelFrequencyIndex: Int = 0
    @State private var selectedTravelInterestIndex: Int = 0
    
    var body: some View {
        ScrollView {
            content
        }
    }
    
    var content: some View {
        VStack(alignment: .leading) {
            header
            description
            fields
            saveButton
            Spacer()
        }
    }
    
    var header: some View {
        Text("Hello, Remy")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
    
    var description: some View {
        Text("You can edit your profile here for personalized recommendations.")
            .padding(.horizontal)
            .padding(.bottom)
    }
    
    var fields: some View {
        HStack {
            leftFields
            Spacer()
            Divider()
            Spacer()
            midFields
            Spacer()
            Divider()
            Spacer()
            rightFields
        }
    }
    
    var saveButton: some View {
        Button {
            User.user.username = username
            User.user.occupation = occupation
            User.user.income = income
            User.user.creditScore = creditScore
            User.user.budget = budget
            User.user.income = income
            User.user.travelFrequency = travelFrequency
            User.user.travelInterest = travelInterest
        } label: {
            Text("Save")
        }
        .padding()
    }
    
    var leftFields: some View {
        VStack(alignment: .leading) {
            Text("Username")
                .fontWeight(.bold)
            TextField("im_a_rich_tabby", text: $username)
                .padding()
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20)
                )
            
            Spacer()
            
            Text("Occupation")
                .fontWeight(.bold)
            Picker("Occupation", selection: $selectedOccupationIndex) {
                ForEach(0..<7) { index in
                    Text(self.occupations[index])
                }
            }
            .onChange(of: selectedOccupationIndex) {
                occupation = occupationStringConverter(occupation: occupations[selectedOccupationIndex])
            }
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            Spacer()
            
            Text("Annual Income ($)")
                .fontWeight(.bold)
            Picker("Annual Income ($)", selection: $selectedIncomeIndex) {
                ForEach(0..<15) { index in
                    Text(String(self.incomes[index]))
                }
            }
            .onChange(of: selectedIncomeIndex) {
                income = incomes[selectedIncomeIndex]
            }
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            Spacer()
        }
        .padding()
    }
    
    var midFields: some View {
        VStack(alignment: .leading) {
            Text("Credit Score")
                .fontWeight(.bold)
            Picker("Credit Score", selection: $selectedCreditScoreIndex) {
                ForEach(0..<5) { index in
                    Text(creditScoreDisplay(creditScore: self.creditScores[index]))
                }
            }
            .onChange(of: selectedCreditScoreIndex) {
                creditScore = creditScores[selectedCreditScoreIndex]
            }
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            Spacer()
            Text("Annual Fee Budget ($)")
                .fontWeight(.bold)
            TextField("200", text: $budgetInput)
                .onReceive(Just(budgetInput)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        budgetInput = filtered
                    }
                }
                .onChange(of: budgetInput) {
                    budget = Int(budgetInput) ?? 200
                }
                .padding()
                .background(
                    .ultraThinMaterial,
                    in: RoundedRectangle(cornerRadius: 20)
                )
            
            Spacer()
        }
        .padding()
    }
    
    var rightFields: some View {
        VStack(alignment: .leading) {
            Text("Do you travel frequently?")
                .fontWeight(.bold)
            Picker("Travel Frequency", selection: $selectedTravelFrequencyIndex) {
                ForEach(0..<2) { index in
                    Text(booleans[index])
                }
            }
            .onChange(of: selectedTravelFrequencyIndex) {
                travelFrequency = booleans[selectedTravelFrequencyIndex] == "Yes"
            }
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            Spacer()
            
            Text("Do you want to travel more?")
                .fontWeight(.bold)
            Picker("Credit Score", selection: $selectedTravelInterestIndex) {
                ForEach(0..<2) { index in
                    Text(booleans[index])
                }
            }
            .onChange(of: selectedTravelInterestIndex) {
                travelInterest = booleans[selectedTravelInterestIndex] == "Yes"
            }
            .background(
                .ultraThinMaterial,
                in: RoundedRectangle(cornerRadius: 20)
            )
            
            Spacer()
        }
        .padding()
    }
}

extension ProfileView {
    func creditScoreToRange(_ creditScore: CreditScore) -> String {
        switch(creditScore) {
        case .poor: 
            return "300-579"
        case .fair:
            return "580-669"
        case .good:
            return "670-739"
        case .great:
            return "740-799"
        case .excellent:
            return "800-850"
        }
    }
    
    func occupationStringConverter(occupation: String) -> Occupation {
        if (occupation == "Student") { return Occupation.student }
        if (occupation == "Early Professional") { return Occupation.earlyProfessional }
        if (occupation == "Mid Career") { return Occupation.midCareer }
        if (occupation == "Business Owner") { return Occupation.businessOwner }
        if (occupation == "Freelance") { return Occupation.freelance }
        if (occupation == "Executive") { return Occupation.executive }
        return Occupation.unemployed
    }
    
    func creditScoreDisplay(creditScore: CreditScore) -> String {
        switch(creditScore) {
        case .poor:
            return "Poor (\(creditScoreToRange(creditScore)))"
        case .fair:
            return "Fair (\(creditScoreToRange(creditScore)))"
        case .good:
            return "Good (\(creditScoreToRange(creditScore)))"
        case .great:
            return "Great (\(creditScoreToRange(creditScore)))"
        case .excellent:
            return "Excellent (\(creditScoreToRange(creditScore)))"
        }
    }
}

#Preview {
    ProfileView()
        .glassBackgroundEffect()
}
