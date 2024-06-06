//
//  SettingsDetailView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 06.06.2024.
//

import SwiftUI

struct SettingsDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel
    
    
    var settingModel: App_Setting
    
    var body: some View {
            ZStack {
            App_Background1()
                VStack(spacing: 0) {
                    HeaderBack(title: settingModel.name) {
                        dismiss()
                        vm.isTabBarisHidden = false
                    }
                    .padding(.bottom, 32)
                    ScrollView {
                        Text(settingModel.text)
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(.horizontal, 16)
            }
            .navigationBarHidden(true)
            .onAppear {
                vm.isTabBarisHidden = true
            }
        }
  
}

#Preview {
    SettingsDetailView(settingModel: App_Setting(name: "Term", icon: "icon_term", text: "ALALALALALLALAAL"))
        .environmentObject(ViewModel())
}
