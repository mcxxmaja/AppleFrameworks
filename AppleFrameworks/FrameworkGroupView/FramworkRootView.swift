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
            FrameworkListView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            FrameworkGridView()
                .tabItem {
                    Image(systemName: "square.grid.3x3.fill")
                    Text("Grid")
                }
        }
    }
}

#Preview {
    FramworkRootView()
}
