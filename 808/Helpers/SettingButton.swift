//
//  SettingButton.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI


struct SettingButton: View {
    var text = ""
    var text2 = ""
    var imageName = ""
    var color: Color = .blue
    var body: some View {
        ZStack {
            Color(.second)
                .cornerRadius(20)
                
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 25, height: 28)
                    .foregroundStyle(color)
                
                Text(text)
                    .padding(.horizontal)
                    .font(.system(size: 17,weight: .bold))
                Spacer()
                Text(text2)
                    .padding(7)
                    .background {
                        Color.grayApp.cornerRadius(40)
                    }
            }
            .padding()
            .foregroundStyle(.white)
        }
        .frame( height: 74)
    }
}

#Preview {
    SettingButton(text: "Share our app", text2: "Share", imageName: "square.and.arrow.up.fill")
}
