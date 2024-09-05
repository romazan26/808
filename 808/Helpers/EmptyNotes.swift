//
//  EmptyNotes.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct EmptyNotes: View {
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
            Text("Create an entry")
                .foregroundStyle(.white)
                .font(.system(size: 22, weight: .bold))
                .padding(.top)
            Text("There are no records here")
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
    EmptyNotes()
}
