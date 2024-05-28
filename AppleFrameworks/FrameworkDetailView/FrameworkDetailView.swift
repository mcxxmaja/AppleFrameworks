//
//  DetailsView.swift
//  AppleFrameworks
//
//  Created by Maja on 20/05/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    let needsXButton: Bool
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
            if needsXButton {
                XDismissButton(isShowing: $isShowingDetailView)
            }

            Spacer()
            
            FrameworkTitleView(framework: framework, imageSize: 100, horizontal: false)
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button{
                isShowingSafariView = true
            } label: {
                LearnMoreButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView) {
            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
         }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.frameworks[0], needsXButton: false, isShowingDetailView: .constant(false))
}
#Preview {
    FrameworkDetailView(framework: MockData.frameworks[0], needsXButton: true, isShowingDetailView: .constant(false))
}
