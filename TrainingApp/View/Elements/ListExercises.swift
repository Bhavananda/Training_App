//
//  ListExercises.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 03.06.2024.
//

import SwiftUI

struct ListExercises: View {
    
    var colorCell = Color(UIColor( #colorLiteral(red: 0.1764705882, green: 0.1764705882, blue: 0.1764705882, alpha: 1)))
    var colorBoard = Color(UIColor( #colorLiteral(red: 0.3254901961, green: 0.3215686275, blue: 0.3215686275, alpha: 1)))
    var name: String = "Kalabanga"
    var repeats: Int = 10
    
    var body: some View {
        
        ZStack {
            GPRoundedRectangle(cornerRadius: 12, corners: [.topRight, .bottomRight])
                .fill(colorCell)
                .overlay(
                    GeometryReader { geometry in
                        GPRoundedRectangle(cornerRadius: 12, corners: [.topRight, .bottomRight])
                            .fill(colorBoard)
                            .frame(width: 3, height: geometry.size.height)
                            .position(x: 1, y: geometry.size.height / 2)
                    }
                )
            VStack(alignment: .leading, spacing: 12) {
                Text(name)
                HStack {
                    Text("Recommended to repeat:")
                        .foregroundStyle(.white.opacity(0.5))
                    Spacer()
                    Text("X\(repeats)")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
            .padding(12)
            
            
        }
        .frame(height: 70)
    }
}

struct GPRoundedRectangle: Shape {
    var cornerRadius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

#Preview {
    ListExercises()
}
