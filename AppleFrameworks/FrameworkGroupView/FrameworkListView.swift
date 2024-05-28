//
//  FrameworkListView.swift
//  AppleFrameworks
//
//  Created by Maja on 24/05/2024.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkGroupViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MockData.frameworks) { framework in
                    NavigationLink {
                        FrameworkDetailView(framework: framework, needsXButton: false, isShowingDetailView: $viewModel.isShowingDetailView)
                    } label: {
                        FrameworkTitleView(framework: framework, imageSize: 70, horizontal: true)
                    }
                }
            }
            .navigationTitle("Frameworks")
        }
        .accentColor(Color(.label))
    }
}

#Preview {
    FrameworkListView()
}
 
