//
//  SettingsView.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 04.06.2024.
//

import SwiftUI

struct SettingsView: View {
    
    
    var body: some View {
        ZStack {
            App_Background1()
            
            VStack(alignment: .leading) {
                Text("SETTINGS")
                    .foregroundStyle(.white)
                    .padding(.bottom, 32)
                ScrollView {
                    VStack(spacing: 0) {
                        MyButton(text: "Privacy Policy", icon: "folder")
                        Divider()
                            
                        MyButton(text: "Privacy Policy", icon: "folder")
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                
                
                .padding(.trailing, 19)
                
            }
            .padding(.leading, 13)
        }
        
    }
}

struct MyButton: View {
    
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)))
    var text: String
    var icon: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorBack)
            
            VStack {
                HStack {
                    Image(systemName: icon)
                    Text(text)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white.opacity(0.2))
                }
                .padding(.leading, 12)
                .padding(.trailing, 16)
                .frame(height: 44)
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
