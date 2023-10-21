//
//  AssistantView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI

struct AssistantView: View {
    @State private var text: String = "" // User inputted text
    
    @ObservedObject private var vm: AssistantViewModel = AssistantViewModel()
    
    var body: some View {
        content
    }
    
    var content: some View {
        ScrollView {
            VStack(alignment: .leading) {
                messages
                keyboard
            }
        }
    }
    
    var messages: some View {
        Group {}
    }
    
    var keyboard: some View {
        HStack {
            TextField("Send a message...", text: $text)
                .foregroundStyle(Color.white)
            Button {
                Task {
                    await vm.respond(msg: text)
                    text = ""
                }
            } label: {
                Image(systemName: "paperplane.fill")
            }
        }
        .padding()
        .background(
            .regularMaterial,
            in: RoundedRectangle(cornerRadius: 20)
        )
        .padding()
        .shadow(radius: 3)
    }
    
    @ViewBuilder
    func alternatingView(for index: Int) -> some View {
        Group {
            if index % 2 == 0 {
                userMessage(query: chatbotViewModel.messages[index])
            } else {
                botMessage(response: chatbotViewModel.messages[index])
            }
        }
    }
    
    @ViewBuilder
    func botMessage(response: String) -> some View {
        HStack {
            /*
            MARK: Change to a new one
            Image("Robot")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .shadow(radius: 3)
             */
            Image(systemName: "person") // MARK: Remove
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .shadow(radius: 3)
            Text(response)
        }
        .padding()
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 20)
        )
        .padding()
    }
    
    @ViewBuilder
    func userMessage(query: String) -> some View {
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 70, height: 70)
                .shadow(radius: 3)
            Text(query)
        }
        .padding()
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(cornerRadius: 20)
        )
        .padding()
    }
}

#Preview {
    AssistantView()
}
