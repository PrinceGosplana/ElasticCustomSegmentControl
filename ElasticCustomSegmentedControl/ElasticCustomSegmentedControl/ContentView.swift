//
//  ContentView.swift
//  ElasticCustomSegmentedControl
//
//  Created by OLEKSANDR ISAIEV on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    /// View Properties
    @State private var activiTab: SegmentedTab = .home
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                SegmentedControl(tabs: SegmentedTab.allCases,
                                 activeTab: $activiTab,
                                 height: 35,
                                 font: .body,
                                 activeTint: .white,
                                 inActiveTint: .gray.opacity(0.5)
                ) { size in
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 4)
                        .padding(.horizontal, 10)
                        .frame(maxWidth: .infinity, alignment: .bottom)
                }
                
                Spacer(minLength: 0)
            }
            .navigationTitle("Segmented Control")
        }
    }
}

#Preview {
    ContentView()
}
