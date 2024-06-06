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
                .overlay(
                    GeometryReader { geometry in
                        Rectangle()
                            .fill(colorBack2)
                            .frame(width: geometry.size.width, height: 3 )
                            .position(x: geometry.size.width / 2, y: 1 )
                    }
                )
            HStack(alignment: .center, spacing: 66) {
                Button {
                    selectedTab = .workout
                } label: {
                    VStack(spacing: 8) {
                        Image("icon_ball")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(selectedTab == .workout ? Color.app_Pink : colorBack2)
                        Text("Workout")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundStyle(selectedTab == .workout ? Color.app_Pink : colorBack2)
                    }
                    .mask(selectedTab == .workout ? Color.pink : colorBack2)
                }
                
                Button {
                    print("Here is your ADD")
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.app_Pink)
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 24, height: 24)
                            .padding(10)
                    }
                    .fixedSize()
                }
                .padding(.bottom, 14)
                
                Button {
                    selectedTab = .settings
                } label: {
                    VStack(spacing: 8) {
                        Image("icon_settings")
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(selectedTab == .settings ? Color.app_Pink : colorBack2)
                        Text("Settings")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundStyle(selectedTab == .settings ? Color.app_Pink : colorBack2)
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
