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

enum EmotionNotes:CaseIterable, Identifiable{
    case heart
    case smile
    case sad
    case cry
    
    var image: ImageResource {
        switch self{
        
        case .heart:
                .heart
        case .smile:
                .smile
        case .sad:
                .sad
        case .cry:
                .cry
        }
    }
    var id: Self{
        self
    }
}
