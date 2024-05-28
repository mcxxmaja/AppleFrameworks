//
//  AFButton.swift
//  AppleFrameworks
//
//  Created by Maja on 21/05/2024.
//

import SwiftUI

struct LearnMoreButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 280, height: 50)
            .background(.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

#Preview {
    LearnMoreButton(title: "Test Title")
}
