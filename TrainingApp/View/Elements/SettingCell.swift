//
//  SettingCell.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 06.06.2024.
//

import SwiftUI

struct SettingCell: View {
    
    var name: String = "Term of Use"
    var icon: String = "icon_terms"
    var colorBack = Color(UIColor( #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)))
    
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorBack)
            VStack {
                HStack {
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    Text(name)
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .regular))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white.opacity(0.2))
                    
                }
//                if setting != arraySettings.last {
//                    Rectangle()
//                        .fill(.white.opacity(0.2))
//                        .frame(height: 1)
//                }
            }
            .padding(.leading, 12)
            .padding(.trailing, 16)
        }
        .frame(height: 44)
    }
}

#Preview {
    SettingCell()
}
