//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Maja on 20/05/2024.
//

import SwiftUI

struct FrameworkGridView: View {

    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        NavigationLink(value: framework) {
                            FrameworkTitleView(
                                framework: framework,
                                imageSize: 90,
                                horizontal: false)
                        }
                    }
                }
            }
            .navigationDestination(for: Framework.self) { framework in
                FrameworkDetailView(
                    framework: framework)
            }
            .navigationTitle("Frameworks")
        } 
    }
}

#Preview {
    FrameworkGridView()
}
 
