//
//  BadgesView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct BadgesView: View {
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
            VStack {
                LazyVGrid(columns: [GridItem(),GridItem()], content: {
                    ForEach(Badges.allCases) { badge in
                        BadgeCellView(badge: badge)
                    }
                })
            }.padding()
        }
    }
}

#Preview {
    BadgesView()
}
