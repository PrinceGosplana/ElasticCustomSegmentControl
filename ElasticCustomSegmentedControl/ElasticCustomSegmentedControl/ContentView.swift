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
                    activeTint: oposedType ? .white : .primary,
                    inActiveTint: .gray.opacity(0.5)
                ) { size in
                    RoundedRectangle(cornerRadius: oposedType ? 30 : 0)
                        .fill(.blue)
                        .frame(height: oposedType ? size.height : 4)
                        .padding(.horizontal, oposedType ? 0 : 10)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                }
                .padding(.top, oposedType ? 0 : 10)
                .background {
                    RoundedRectangle(cornerRadius: oposedType ? 30 : 0)
                        .fill(.ultraThinMaterial)
                        .ignoresSafeArea()
                }
                .padding(.horizontal, oposedType ? 15 : 0)
                
                Toggle("Segmented control Type - 2", isOn: $oposedType)
                    .padding(10)
                    .background(.regularMaterial, in: .rect(cornerRadius: 10))
                
                Spacer(minLength: 0)
            }
            .padding(.vertical, oposedType ? 15 : 0)
            .animation(.snappy, value: oposedType)
            .navigationTitle("Segmented Control")
            .toolbarBackground(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
