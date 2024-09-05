//
//  BadgesView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct BadgesView: View {
    
    @StateObject var vm: BadgeViewModel
    @Binding var isPresentBadges: Bool
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - Top toolbar
                HStack {
                    Button(action: {isPresentBadges.toggle()}, label: {
                        Image(.closeButton)
                            .resizable()
                            .frame(width: 32, height: 32)
                    })
    
                    Spacer()
                    Text("Badges")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                        .padding(.leading, -27)
                    Spacer()
                    
                }
                Spacer()
                LazyVGrid(columns: [GridItem(),GridItem()], content: {
                    ForEach(Badges.allCases) { badge in
                        BadgeCellView(badge: badge, vm: vm)
                    }
                })
                Spacer()
            }.padding()
        }
            
    }
}

#Preview {
    BadgesView(vm: BadgeViewModel(), isPresentBadges: .constant(true))
}
