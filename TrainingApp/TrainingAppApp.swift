//
//  TrainingAppApp.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

@main
struct TrainingAppApp: App {
    
    @StateObject var vm: ViewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            switch vm.currentView {
            case .preloader:
                Preloader()
            case .onboarding:
                OnBoarding()
                    .transition(.opacity.animation(.easeInOut))
            case .main:
                ContentView()
                    .transition(.opacity.animation(.easeInOut))
            }
        }
        .environmentObject(vm)
        
    }
}
