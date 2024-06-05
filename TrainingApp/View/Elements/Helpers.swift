//
//  Helpers.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 05.06.2024.
//

import Foundation
import SwiftUI

extension Int {
    var formattedTime: String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
