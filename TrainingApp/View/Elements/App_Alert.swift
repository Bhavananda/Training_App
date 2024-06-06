//
//  App_Alert.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 05.06.2024.
//

import SwiftUI

struct App_Alert: View {
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)))
    
    var funcFinish: () -> Void
    var funcCancel: () -> Void
    
    var body: some View {
        ZStack(alignment: .center) {
            VStack {
                Text("Are you sure you want to finish the workout?")
                    .bold()
                    .font(.system(size: 17))
                    .foregroundStyle(.white)
                    .frame(maxWidth: 238, alignment: .center)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 15)
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
                    .multilineTextAlignment(.center)
                Divider()
                    .foregroundStyle(.white)
                VStack(alignment: .center) {
                    Button {
                       funcFinish()
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.clear)
                            Text("Finish")
                                .bold()
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    
                    Divider()
                        .foregroundStyle(.white)
                    Button {
                        funcCancel()
                    } label: {
                        ZStack {
                            Rectangle()
                                .fill(Color.clear)
                            Text("Cancel")
                        }
                    }
                    Divider()
                }
            }
        }
        .background(colorBack.opacity(0.82))
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .frame(width: 270, height: 168)
        
        .zIndex(2)

    }
}

#Preview {
    App_Alert() {
        
    } funcCancel: {
        
    }
}
