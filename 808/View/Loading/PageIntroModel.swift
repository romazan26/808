//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var description: String
    var imageUrl: String
    var tag: Int

    static var samplePage = PageIntro(description: "Stop challenging yourself every day!", imageUrl: "intro1", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(description: "Stop challenging yourself every day!", imageUrl: "intro1", tag: 0),
        PageIntro(description: "Track your progress and reach new heights!", imageUrl: "intro2", tag: 1),
        PageIntro(description: "Get badges for achieving results!", imageUrl: "intro3", tag: 2)
    ]
}
