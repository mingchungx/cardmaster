//
//  AssistantViewModel.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-21.
//

import Foundation

@MainActor
final class AssistantViewModel: ObservableObject {
    @Published var messages: [String] = []
    
    func respond(msg: String) async {
        self.messages.append(msg)
        self.messages.append("RESPONSE")
    }
}
