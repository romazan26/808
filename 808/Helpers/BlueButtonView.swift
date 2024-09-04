//
//  OrangeButtonView.swift
//  FastTrack
//
//  Created by Роман on 26.07.2024.
//

import SwiftUI

struct BlueButtonView: View {
    var text = "NextCancel"
    var image = ""
    var backGrouund = Color.blueApp
    var body: some View {
        ZStack {
            backGrouund
            HStack {
                Image(systemName: image)
                    .foregroundStyle(.white)
                Text(text)
                    .foregroundStyle(.white)
                .font(.system(size: 17, weight: .bold))
            }
        }
        .frame(height: 56)
        .cornerRadius(12)
    }
}

#Preview {
    BlueButtonView()
}
