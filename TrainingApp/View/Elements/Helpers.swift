//
//  Helpers.swift
//  TrainingApp
//
//  Created by Bhavananda Das on 05.06.2024.
//

import Foundation
import SwiftUI

extension Int {
    var formattedTime: String {
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

extension Color {
    static let app_Pink = Color(UIColor( #colorLiteral(red: 0.9019607843, green: 0, blue: 0.2862745098, alpha: 1)))
    static let app_Back_Gray = Color(UIColor( #colorLiteral(red: 0.1333333333, green: 0.1333333333, blue: 0.1333333333, alpha: 1)))
   
}

struct Divided<Content: View>: View {
    var content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        _VariadicView.Tree(DividedLayout()) {
            content
        }
    }

    struct DividedLayout: _VariadicView_MultiViewRoot {
        @ViewBuilder
        func body(children: _VariadicView.Children) -> some View {
            let last = children.last?.id

            ForEach(children) { child in
                child

                if child.id != last {
                    Rectangle()
                        .fill(.white.opacity(0.2))
                        .frame(height: 1)
                }
            }
        }
    }
}
