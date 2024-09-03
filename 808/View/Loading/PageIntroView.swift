//
//  PageIntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct PageIntroView: View {
    var page: PageIntro
    var body: some View {
        VStack {
            Text(page.description)
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .heavy))
            
            ZStack {
                Circle()
                    .foregroundStyle(.blueApp)
                    .blur(radius: 70)
                Image(page.imageUrl)
                    .resizable()
                .scaledToFit()
            }
                
            
            
            
            
            
        }
    }
}


#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
