//
//  AppTab.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import SwiftUI

struct AppTab: View {
    
    @Binding var selectedTab: TapEnum
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
    var colorBack2 = Color(UIColor( #colorLiteral(red: 0.3254901961, green: 0.3215686275, blue: 0.3215686275, alpha: 1)))
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorBack)
            HStack(alignment: .center, spacing: 66) {
                Button {
                    selectedTab = .workout
                } label: {
                    VStack {
                        Image("icon_ball")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("Workout")
                            .foregroundStyle(colorBack2)
                    }
                    .mask(selectedTab == .workout ? Color.pink : colorBack2)
                }
                
                Button {
                    print("Here is your ADD")
                } label: {
                    ZStack {
                        Circle()
                            .fill(.pink)
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                            .padding(10)
                    }
                    .fixedSize()
                }
                
                Button {
                    selectedTab = .settings
                } label: {
                    VStack {
                        Image("icon_settings")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                        Text("Settings")
                            .foregroundStyle(colorBack2)
                    }
                    .mask(selectedTab == .settings ? Color.pink : colorBack2)
                }
            }
        }
        .frame(height: 91)
        .frame(maxWidth: .infinity)
        .ignoresSafeArea(edges: .bottom)
    }
    
}

#Preview {
    AppTab(selectedTab: .constant(.workout))
}
