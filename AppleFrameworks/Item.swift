//
//  Item.swift
//  AppleFrameworks
//
//  Created by Maja on 16/05/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
