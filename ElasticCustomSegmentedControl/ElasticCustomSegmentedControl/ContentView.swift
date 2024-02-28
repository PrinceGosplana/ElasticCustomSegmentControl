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
    @State private var oposedType: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                SegmentedControl(
                    tabs: SegmentedTab.allCases,
                    activeTab: $activiTab,
                    height: 35,
                    font: .body,
                    activeTint: .primary,
                    inActiveTint: .gray.opacity(0.5)
                ) { size in
                    Rectangle()
                        .fill(.blue)
                        .frame(height: 4)
                        .padding(.horizontal, 10)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .padding(.top, 10)
                .background {
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                }
                
                Toggle("Segmented control Type - 2", isOn: $oposedType)
                    .padding(10)
                    .background(.regularMaterial, in: .rect(cornerRadius: 10))
                
                Spacer(minLength: 0)
            }
            .navigationTitle("Segmented Control")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
