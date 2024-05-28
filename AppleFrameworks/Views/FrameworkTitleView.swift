//
//  FrameworkTitleView.swift
//  AppleFrameworks
//
//  Created by Maja on 24/05/2024.
//

import SwiftUI

struct FrameworkTitleView: View {
    let framework: Framework
    
    var body: some View {
//        VStack { //FIXME: VSTACK FOR GRID
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70) //FIXME: 90 FOR GRID
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
                .padding() //FIXME: FOR LIST ONLY
        }
//        .padding() //FIXME: FOR GRID
    }
}

#Preview {
    FrameworkTitleView(framework: MockData.sampleFramework)
}
