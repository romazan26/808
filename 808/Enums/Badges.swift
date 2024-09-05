//
//  Badges.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import Foundation
import SwiftUI

enum Badges: CaseIterable, Identifiable {
    case first
    case five
    case middle
    case firteenth
    case experienced
    case conqueror
    
    var countComleted: Int16 {
        switch self{
            
        case .first:
            1
        case .five:
            5
        case .middle:
            10
        case .firteenth:
            15
        case .experienced:
            20
        case .conqueror:
            25
        }
    }
    
    var name: String{
        switch self {
            
        case .first:
            "First victory"
        case .five:
            "Five steps to success"
        case .middle:
            "Middle of the road"
        case .firteenth:
            "Fifteenth milestone"
        case .experienced:
            "Experienced Seeker"
        case .conqueror:
            "Conqueror of peaks"
        }
    }
    
    var compImage: ImageResource{
        switch self{
            
        case .first:
                .badge1
        case .five:
                .badge2
        case .middle:
                .badge3
        case .firteenth:
                .badge4
        case .experienced:
                .badge5
        case .conqueror:
                .badge6
        }
    }
    
    var noCompImage: ImageResource{
        switch self{
            
        case .first:
                .badge11
        case .five:
                .badge22
        case .middle:
                .badge33
        case .firteenth:
                .badge44
        case .experienced:
                .badge55
        case .conqueror:
                .badge66
        }
    }
    
    var id: Self{
        self
    }
}
