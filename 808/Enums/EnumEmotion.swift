//
//  EnumEmotion.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import Foundation

enum Emotion{
    case challenge
    case badges
    case diary
    case setting
    case star
    
    var image: ImageResource {
        switch self{
        case .challenge:
                .challenges
        case .badges:
                .badges
        case .diary:
                .diary
        case .setting:
                .settings
        case .star:
                .star
        }
    }
}
