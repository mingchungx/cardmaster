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
            navigator
        } // Overlay the profile editor
    }
    
    var header: some View {
        HStack {
            // Replace with logo or design
            Image("cardmasterLogoSmall")
                .padding(.vertical)
            Image("cardmasterLogoTextSmall")
                .padding(.vertical)
            Spacer()
        }
        .padding(.leading, 30)
    }
    
    var navigator: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "sparkle")
                }
            
            WishlistView()
                .tabItem {
                    Label("Wishlist", systemImage: "heart")
                }
            
            AssistantView()
                .tabItem {
                    Label("Assistant", systemImage: "questionmark.bubble")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
