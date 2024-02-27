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
    
    /// Customize properties
    var displayAsText: Bool = false
    var font: Font = .title3
    var activeTint: Color
    var inActiveTint: Color
    
    /// Indicator View
    @ViewBuilder var indicatorView: (CGSize) -> Indicator
    
    /// View properties
    @State private var excessTabWidth: CGFloat = .zero
    @State private var minX: CGFloat = .zero
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            let containerWidthForEachTab = size.width / CGFloat(tabs.count)
            
            HStack(spacing: 0) {
                ForEach(tabs, id: \.rawValue) { tab in
                    Group {
                        if displayAsText {
                            Text(tab.rawValue)
                        } else {
                            Image(systemName: tab.rawValue)
                        }
                    }
                    .font(font)
                    .foregroundStyle(activeTab == tab ? activeTint : inActiveTint)
                    .animation(.snappy, value: activeTab)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        
                        if let index = tabs.firstIndex(of: tab), let activeIndex = tabs.firstIndex(of: activeTab) {
                            activeTab = tab
                            
                            withAnimation(.snappy(duration: 0.25, extraBounce: 0), completionCriteria: .logicallyComplete) {
                                excessTabWidth = containerWidthForEachTab * CGFloat(index - activeIndex)
                            } completion: {
                                withAnimation(.snappy(duration: 0.25, extraBounce: 0)) {
                                    minX = containerWidthForEachTab * CGFloat(index)
                                    excessTabWidth = 0
                                }
                            }
                            excessTabWidth = containerWidthForEachTab * CGFloat(index - activeIndex)
                        }
                    }
                    .background(alignment: .leading) {
                        if tabs.first == tab {
                            GeometryReader {
                                let size = $0.size
                                
                                indicatorView(size)
                                    .frame(width: size.width + (excessTabWidth < 0 ? -excessTabWidth : excessTabWidth),
                                           height: size.height)
                                    .frame(width: size.width, alignment: excessTabWidth < 0 ? .trailing : .leading)
                                    .offset(x: minX)
                            }
                        }
                    }
                }
            }
            .preference(key: SizeKey.self, value: size)
            .onPreferenceChange(SizeKey.self) { size in
                if let index = tabs.firstIndex(of: activeTab) {
                    minX = containerWidthForEachTab * CGFloat(index)
                    excessTabWidth = 0
                }
            }
        }
        .frame(height: height)
    }
}

fileprivate struct SizeKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
#Preview {
    ContentView()
}
