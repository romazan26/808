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

    static var samplePage = PageIntro(description: "Analyze your success with our statistics", imageUrl: "intro1", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(description: "Analyze your success with our statistics", imageUrl: "intro1", tag: 0),
        PageIntro(description: "Fix your thoughts and edit!", imageUrl: "intro2", tag: 1),
        PageIntro(description: "All achievements in one place", imageUrl: "intro3", tag: 2)
    ]
}
