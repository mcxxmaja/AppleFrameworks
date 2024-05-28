//
//  FrameworkGridViewModel.swift
//  AppleFrameworks
//
//  Created by Maja on 22/05/2024.
//

import SwiftUI

final class FrameworkGroupViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet { isShowingDetailView = true }
    }
    
    @Published var isShowingDetailView = false
}
