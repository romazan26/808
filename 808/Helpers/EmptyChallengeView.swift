//
//  SwiftUIView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct EmptyChallengeView: View {
    var body: some View {
        VStack(spacing: 15){
            ZStack {
                Circle()
                    .frame(width: 70)
                    .foregroundStyle(.blue)
                    .blur(radius: 50)
                Image(.challngEnty)
                    .resizable()
                    .frame(width: 158, height: 158)
            }
            Text("Create a challenge")
                .foregroundStyle(.white)
                .font(.system(size: 22, weight: .bold))
                .padding(.top)
            Text("Your list of challenges is currently empty")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
        }
        .padding()
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .background {
            Color.second.cornerRadius(20)
        }
    }
}

#Preview {
    EmptyChallengeView()
}
