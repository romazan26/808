//
//  ChallengeCellView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct ChallengeCellView: View {
    @ObservedObject var challenge: Challeng
    var body: some View {
        VStack {
            Image(uiImage: challenge.emotion ?? UIImage(resource: .star))
                .resizable()
                .frame(width: 40, height: 40)
            Text(challenge.name ?? "")
                .foregroundStyle(.white)
                .font(.system(size: 17, weight: .bold))
            CustomProgressBar(progress: Float(100 / challenge.day * challenge.dayEnd),
                              width: 300,
                              color: .green,
                              secondColor: .gray.opacity(0.5))
                .padding(10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background {
            Color.second.cornerRadius(20)
        }
    }
}

#Preview {
    ChallengeCellView(challenge: Challeng())
}
