//
//  OnBoarding.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct OnBoarding: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack {
            Image("sportsman")
                .resizable()
                .scaledToFit()
                .offset(x: -40)
                .scaleEffect(1.2)
            
            VStack(alignment: .leading) {
                Text("Unleash Your Potential")
                    .font(.custom("BebasNeue-Regular", size: 64))
                    .foregroundStyle(.white)
                
                Text("Dive into the world of American football training. Explore dynamic workouts designed to unlock your gridiron potential.")
                    .foregroundStyle(.white.opacity(0.5))
                    .multilineTextAlignment(.leading)
            }
            .padding(.horizontal, 32)
            .padding(.bottom, 44)
            
            App_Button(name: "START", iconName: "arrow_icon", iconFrame: true) {
                vm.goToMain()
            }
            .padding(.horizontal, 16)
        }
        .background {
            App_Background1()
        }
        
    }
}

#Preview {
    OnBoarding()
        .environmentObject(ViewModel())
}
