//
//  FrameworkGridView.swift
//  AppleFrameworks
//
//  Created by Maja on 20/05/2024.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGroupViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkTitleView(framework: framework, imageSize: 90, horizontal: false)
                            .onTapGesture {
                                viewModel.selectedFramework = framework 
                            }
                    }
                }
            }
            .navigationTitle("Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView) {
                FrameworkDetailView(framework: viewModel.selectedFramework ?? MockData.sampleFramework, needsXButton: true, isShowingDetailView: $viewModel.isShowingDetailView)
            }
        } 
    }
}

#Preview {
    FrameworkGridView()
}
 
