//
//  App_Progress.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import SwiftUI

struct App_Progress: View {
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.clear
            
            Image("progress_image")
                .resizable()
                .frame(width: 35, height: 35)
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(
                    .linear(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animate
                )
                .onAppear {
                    withAnimation {
                        animate.toggle()
                    }
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    App_Progress()
}
