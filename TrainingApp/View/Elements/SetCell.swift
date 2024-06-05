//
//  SetCell.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct SetCell: View {
    
    var colorCell = Color(UIColor( #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)))
    var name: String = "GENERATED SET 1"
    var duration: Int = 30
    var count: Int = 15
    
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(colorCell)
                HStack {
                    HStack {
                        Image("cell_image")
                            .resizable()
                            .scaledToFit()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(name)
                            HStack(spacing: 10) {
                                HStack {
                                    Image("icon_clock")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("\(duration) min.")
                                }
                                .padding(8)
                                .background(.white.opacity(0.1))
                                .cornerRadius(8)
                                
                                
                                
                                HStack {
                                    Image("icon_ball_white")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("\(count) exer.")
                                }
                                .padding(8)
                                .background(.white.opacity(0.1))
                                .cornerRadius(8)
                                
                            }
                        }
                        .padding(.leading, 12)
                        .foregroundStyle(.white)
                    }
                    .padding(.vertical, 12)
                    .padding(.leading, 12)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .frame(width: 24, height: 24)
                        .padding(.trailing)
                        .foregroundColor(.white.opacity(0.2))
                }
                
            }
        }
        .frame(height: 89)
    }
}

#Preview {
    SetCell()
}
