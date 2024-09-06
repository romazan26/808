//
//  ChallengesDayGridView.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import Foundation
import SwiftUI

struct ChallengesDayGridView: View {
    
    var dayEnd: Int16 = 0
    
    var columns: [GridItem] = [
        GridItem(spacing: 16),
        GridItem(spacing: 16),
        GridItem(spacing: 16),
        GridItem(spacing: 16),
        GridItem(spacing: 16)
    ]
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            //MARK: - Empty rectangle grid
            LazyVGrid(columns: columns, content: {
                ForEach(0...29, id: \.self) { index in
                    Color(.main)
                        .cornerRadius(6)
                        .frame(width: 56, height: 56)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.grayApp, lineWidth: 2.0)
                        }
                }
            })
            
            //MARK: - Day off grid
            if dayEnd != 0{
                LazyVGrid(columns: columns, content: {
                    ForEach(0...dayEnd - 1, id: \.self) { index in
                        Image(.star)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .padding(.top, 5)
                    }
                })
            }
            
        }
    }
}
