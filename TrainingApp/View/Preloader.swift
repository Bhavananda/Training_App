//
//  Preloader.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct Preloader: View {
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        ZStack {
            App_Background2()
         
            App_Progress()
            
        }
        .onAppear {
            vm.goToOnBoarding()
        }
    }
}

#Preview {
    Preloader()
        .environmentObject(ViewModel())
}
