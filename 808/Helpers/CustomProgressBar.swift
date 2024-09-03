//
//  CustomProgressBar.swift
//  CoachMate
//
//  Created by Роман on 30.08.2024.
//

import SwiftUI

struct CustomProgressBar: View {
    var progress: Float = 32
    var width: CGFloat = 204
    var color: Color = .blueApp
    var secondColor: Color = .black.opacity(0.16)
            var body: some View {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(secondColor)
                   
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(color)
                            .frame(width: CGFloat(progress * (Float(width) / 100)))
                    
                }
                .frame(width: width,height: 10)
            }
        }


#Preview {
    CustomProgressBar()
}
