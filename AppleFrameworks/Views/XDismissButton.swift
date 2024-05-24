//
//  XDismissButton.swift
//  AppleFrameworks
//
//  Created by Maja on 24/05/2024.
//

import SwiftUI

struct XDismissButton: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            Button{
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
                    .padding()
            }
        }
    }
}

#Preview {
    XDismissButton(isShowing: .constant(false))
}
