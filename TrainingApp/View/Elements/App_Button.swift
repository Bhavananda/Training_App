//
//  App_Button.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct App_Button: View {
    
    var name: String = "TEST"
    var iconName: String = "arrow_icon"
    var iconFrame: Bool = true
    var isImage: Bool = false
    var functional: () -> Void
    
    
    
   
    var colorButton = Color(UIColor( #colorLiteral(red: 0.9019607843, green: 0, blue: 0.2862745098, alpha: 1)))
    
    var body: some View {
        if !isImage {
            Button {
                functional()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(colorButton)
                    HStack {
                        Text(name)
                            .font(.custom("BebasNeue-Bold", size: 20))
                            .frame(maxWidth: .infinity)
                        if iconName != "" {
                            if iconFrame {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white.opacity(0.2))
                                    
                                    Image(iconName)
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .padding(7)
                                }
                                .fixedSize()
                            } else {
                                Image(iconName)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .padding(7)
                            }
                        } else {
                            EmptyView()
                        }
                    }
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                }
            }
            .frame(height: 54)
            .frame(maxWidth: .infinity)
        } else {
           ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorButton)
                HStack {
                    Text(name)
                        .font(.custom("BebasNeue-Bold", size: 20))
                        .frame(maxWidth: .infinity)
                    if iconName != "" {
                        if iconFrame {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white.opacity(0.2))
                                
                                Image(iconName)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .padding(7)
                            }
                            .fixedSize()
                        } else {
                            Image(iconName)
                                .resizable()
                                .frame(width: 18, height: 18)
                                .padding(7)
                        }
                    } else {
                        EmptyView()
                    }
                }
                .foregroundStyle(.white)
                .padding(.horizontal, 12)
            }
           .frame(height: 54)
           .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    App_Button() {
        
    }
}
