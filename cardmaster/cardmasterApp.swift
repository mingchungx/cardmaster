//
//  cardmasterApp.swift
//  cardmaster
//
//  Created by Mingchung Xia on 2023-10-20.
//

import SwiftUI

@main
struct cardmasterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
