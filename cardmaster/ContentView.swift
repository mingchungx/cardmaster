//
//  ContentView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        content
            .glassBackgroundEffect()
    }
    
    var content: some View {
        VStack {
            header
            Divider()
                .padding()
            navigator
        } // Overlay the profile editor
    }
    
    var header: some View {
        HStack {
            // Replace with logo or design
            Text("cardmaster")
            Spacer()
            Image(systemName: "person.fill")
                .padding(10)
                .background(
                    .ultraThinMaterial, 
                    in: Circle()
                )
        }
        .padding()
    }
    
    var navigator: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            AssistantView()
                .tabItem {
                    Label("Assistant", systemImage: "questionmark.circle")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
