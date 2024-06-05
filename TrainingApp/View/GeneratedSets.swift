//
//  GeneratedSets.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct GeneratedSets: View {
    @Binding var popToMain: Bool
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderBack(title: "Generated Sets") {
                dismiss()
                vm.isTabBarisHidden = false
            }
            
            .padding(.top, 16)
            .padding(.bottom, 32)
            
            ScrollView(showsIndicators: false) {
                ForEach(vm.setsArray) { set in
                    NavigationLink {
                        SetDetail(popToMain: $popToMain, setModel: set)
                    } label: {
                        SetCell(name: set.name, duration: set.duration, count: set.exercisesCount)
                    }
                    .isDetailLink(false)
                }
            }
        }
        .navigationBarHidden(true)
        .padding(.horizontal, 16)
        .background {
            App_Background1()
        }
        .onAppear {
            vm.isTabBarisHidden = true
        }
        
    }
    
}


#Preview {
    GeneratedSets(popToMain: .constant(false))
        .environmentObject(ViewModel())
}
