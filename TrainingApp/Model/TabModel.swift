//
//  TabModel.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import Foundation
import SwiftUI


struct TabModel: Identifiable {
    var id = UUID()
    var name: String
    var icon: String
    var tap: TapEnum
}

enum TapEnum: String {
    case workout, add, settings
}


var tabItems = [
    TabModel(name: "Workout", icon: "icon_workout_on", tap: .workout),
    TabModel(name: "", icon: "icon_add", tap: .add),
    TabModel(name: "Settings", icon: "icon_settings_on", tap: .settings),
]

