//
//  OpenButtonView.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import SwiftUI

struct OpenButtonView: View {
    var body: some View {
        Text("Open")
            .foregroundStyle(.white)
            .font(.system(size: 15))
            .padding(10)
            .background {
                Color.grayApp.cornerRadius(40)
            }
    }
}

#Preview {
    OpenButtonView()
}
