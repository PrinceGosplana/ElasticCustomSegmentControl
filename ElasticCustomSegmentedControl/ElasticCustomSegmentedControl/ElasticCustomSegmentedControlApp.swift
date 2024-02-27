//
//  ElasticCustomSegmentedControlApp.swift
//  ElasticCustomSegmentedControl
//
//  Created by OLEKSANDR ISAIEV on 27.02.2024.
//

import SwiftUI

@main
struct ElasticCustomSegmentedControlApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

enum SegmentedTab: String, CaseIterable {
    case home = "house.fill"
    case favorites = "suit.heart.fill"
    case notifications = "bell.fill"
    case profile = "person.fill"
}
