//
//  SwiftUIView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct EmptyChallengeView: View {
    var body: some View {
        ZStack {
            Color.second.cornerRadius(20)
            VStack(spacing: 15){
                ZStack {
                    Circle()
                        .frame(width: 70)
                        .foregroundColor(.blue)
                        .blur(radius: 50)
                    Image(.challngEnty)
                        .resizable()
                        .frame(width: 158, height: 158)
                }
                Text("Create a challenge")
                    .foregroundColor(.white)
                    .font(.system(size: 22, weight: .bold))
                    .padding(.top)
                Text("Your list of challenges is currently empty")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))
            }
            .padding()
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            
        }
    }
}

#Preview {
    EmptyChallengeView()
}
