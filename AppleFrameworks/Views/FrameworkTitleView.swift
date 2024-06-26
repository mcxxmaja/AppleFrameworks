//
//  FrameworkTitleView.swift
//  AppleFrameworks
//
//  Created by Maja on 24/05/2024.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    let imageSize: CGFloat
    let horizontal: Bool
    
    var body: some View {
        if horizontal {
            HStack {
                FrameworkImage(imageName: framework.imageName, size: imageSize)
                FrameworkName(name: framework.name)
            }
        } else {
            VStack {
                FrameworkImage(imageName: framework.imageName, size: imageSize)
                FrameworkName(name: framework.name)
            }
            .padding()
        }
    }
}

struct FrameworkImage: View {
    let imageName: String
    let size: CGFloat
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: size, height: size)
    }
}

struct FrameworkName: View {
    let name: String
    
    var body: some View {
        Text(name)
            .font(.title3)
            .fontWeight(.semibold)
            .scaledToFit()
            .minimumScaleFactor(0.5)
            .foregroundStyle(Color(.label))
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.frameworks[0], imageSize: 70, horizontal: true)
}

#Preview {
    FrameworkTitleView(framework: MockData.frameworks[3], imageSize: 90, horizontal: false)
}

#Preview {
    FrameworkTitleView(framework: MockData.frameworks[5], imageSize: 100, horizontal: false)
}
