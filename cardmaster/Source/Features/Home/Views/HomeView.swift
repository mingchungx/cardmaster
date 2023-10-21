//
//  HomeView.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI

struct HomeView: View {
    @State private var showingWishlist: Bool = false
    
    @ObservedObject private var vm: HomeViewModel = HomeViewModel()
 
    var body: some View {
        content
    }
    
    var content: some View {
        Text("HomeView")
    }
}

#Preview {
    HomeView()
        .glassBackgroundEffect()
}
