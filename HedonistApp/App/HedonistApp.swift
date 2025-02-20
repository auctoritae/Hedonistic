//
//  HedonistApp.swift
//  HedonistApp
//
//  Created by Alexander Lobanoff on 11/4/24.
//

import SwiftUI
import SwiftData

@main
struct HedonistApp: App {
    var body: some Scene {
        WindowGroup {
            TabsView()
        }
        .modelContainer(for: Landmark.self)
    }
}
