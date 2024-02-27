//
//  SegmentedControl.swift
//  ElasticCustomSegmentedControl
//
//  Created by OLEKSANDR ISAIEV on 27.02.2024.
//

import SwiftUI

struct SegmentedControl<Indicator: View>: View {
    var tabs: [SegmentedTab]
    @Binding var activeTab: SegmentedTab
    var height: CGFloat = 45
    
    /// Indicator View
    @ViewBuilder var indicatorView: (CGSize) -> Indicator
    
    var body: some View {
        GeometryReader {
            let size = $0.size
        }
        .frame(height: height)
    }
}

#Preview {
    ContentView()
}
