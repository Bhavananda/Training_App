//
//  ViewModel.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import Foundation
import SwiftUI

enum CurrentView {
    case preloader, onboarding, main
}


class ViewModel: ObservableObject {
    
    @Published var currentView: CurrentView = .preloader
    
    @Published var isTabBarisHidden: Bool = false
    
    @Published var setsArray: [SetModel] = [
        SetModel(name: "Power Set Alpha", duration: 30, exercisesCount: 10),
        SetModel(name: "Endurance Set Beta", duration: 22, exercisesCount: 12),
        SetModel(name: "Strength Set Gamma", duration: 35, exercisesCount: 14),
        SetModel(name: "Flexibility Set Delta", duration: 25, exercisesCount: 17),
        SetModel(name: "Agility Set Epsilon", duration: 37, exercisesCount: 19),
        SetModel(name: "Speed Set Zeta", duration: 19, exercisesCount: 18),
        SetModel(name: "Balance Set Eta", duration: 32, exercisesCount: 18),
        SetModel(name: "Coordination Set Theta", duration: 30, exercisesCount: 12),
        SetModel(name: "Stamina Set Iota", duration: 36, exercisesCount: 15)
    ]
    
    @Published var exerciseResults: [ExerciseResult] = []
    
    
    func goToOnBoarding() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.currentView = .onboarding
            }
        }
        
        func goToMain() {
            self.currentView = .main
        }
  
    
    
    
    
}
