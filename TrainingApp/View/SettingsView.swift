//
//  SettingsView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                App_Background1()
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("SETTINGS")
                        .font(.custom("BebasNeue-Bold", size: 32))
                        .foregroundStyle(.white)
                        .padding(.bottom, 32)
                        .padding(.top, 20)
                    
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(vm.settingsArray) { setting in
                                NavigationLink {
                                    SettingsDetailView(settingModel: setting)
                                } label: {
                                    SettingCell(name: setting.name, icon: setting.icon)
                                }
                                
                                if setting != vm.settingsArray.last {
                                    Rectangle()
                                        .fill(.white.opacity(0.2))
                                        .frame(height: 1)
                                        .padding(.horizontal, 12)
                                }
                                
                                
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    .padding(.trailing, 19)
                }
                .padding(.leading, 13)
                
            }
        }
    }
}
#Preview {
    SettingsView()
        .environmentObject(ViewModel())
}
