//
//  ProgressCircleView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct ProgressCircleView: View {
    var progress: Float = 0.8
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 23)
                .opacity(0.2)
                .foregroundStyle(.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 23, lineCap: .butt, lineJoin: .round))
                .foregroundStyle(.blueApp)
                .rotationEffect(Angle(degrees: 90))
        }.padding()
    }
}

#Preview {
    ProgressCircleView()
        .frame(width: 112, height: 112)
}
