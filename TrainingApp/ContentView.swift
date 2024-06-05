//
//  ContentView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: TapEnum = .workout
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack(alignment: .bottom) {
                    switch selectedTab {
                    case .workout:
                        MainView()
                    case .add:
                        EmptyView()
                    case .settings:
                        SettingsView()
                    }
                    if !vm.isTabBarisHidden {
                        withAnimation {
                            AppTab(selectedTab: $selectedTab)
                        }
                    }
                }
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}


//init() {
//            for familyName in UIFont.familyNames {
//                print(familyName)
//
//                for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                    print("-- \(fontName)")
//                }
//            }
//        }
