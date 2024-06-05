//
//  HeaderBack.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct HeaderBack: View {
    
    var title: String = "Testin typing"
    var function: () -> Void
    
    var body: some View {
        HStack {
            Button {
                function()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.white.opacity(0.1))
                    Image(systemName: "arrow.backward")
                        .frame(width: 24, height: 24)
                        .padding(10)
                }
                .fixedSize()
            }
            Spacer()
            Text(title)
            Spacer()
            Image(systemName: "")
                .frame(width: 24, height: 24)
                .padding(10)
        }
        .frame(height: 44)
        .foregroundColor(.white)
        
    }
}

#Preview {
    HeaderBack() {
        
    }
}
