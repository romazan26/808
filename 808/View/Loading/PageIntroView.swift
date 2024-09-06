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
                    .multilineTextAlignment(.center)
                    .padding()
                    .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    .offset(y: -30)
   
                    Image(page.imageUrl)
                        .resizable()
                    .scaledToFit()
                        
                
            }.offset(y: 40)
        
    }
}


#Preview {
    PageIntroView(page: PageIntro.samplePage)
}
