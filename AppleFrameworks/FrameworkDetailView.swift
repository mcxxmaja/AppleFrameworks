//
//  DetailsView.swift
//  AppleFrameworks
//
//  Created by Maja on 20/05/2024.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button{
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color(.label))
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                        .padding()
                }
            }

            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .padding()
                .font(.body)
            
            Spacer()
            
            Button{
                //action
            } label: {
                AFButton(title: "Learn More")
            }
        }
    }
}

#Preview {
    FrameworkDetailView(framework: MockData.frameworks[0], isShowingDetailView: .constant(false))
}
