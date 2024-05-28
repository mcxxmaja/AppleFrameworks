//
//  FramworkRootView.swift
//  AppleFrameworks
//
//  Created by Maja on 28/05/2024.
//

import SwiftUI

struct FramworkRootView: View {
    var body: some View {
        TabView {
            FrameworkGridView()
                .tabItem {
                    Image(systemName: "square.grid.3x3.fill")
                    Text("Grid")
                }
            FrameworkListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
        .background(.black, ignoresSafeAreaEdges: .all)
    }
}

#Preview {
    FramworkRootView()
}
