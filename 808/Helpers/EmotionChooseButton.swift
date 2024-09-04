//
//  EmotionChooseButton.swift
//  808
//
//  Created by Роман on 04.09.2024.
//

import SwiftUI

struct EmotionChooseButton: View {
    var emotion: Emotion
    @StateObject var vm: ChallengesViewModel
    var body: some View {
        ZStack {
            Color(vm.simpleEmotion == emotion ? .blueApp : .grayApp)
                .cornerRadius(8)
            Image(emotion.image)
                .resizable()
                .padding(6)
        }.frame(width: 52, height: 52)
    }
}

#Preview {
    EmotionChooseButton(emotion: Emotion.star, vm: ChallengesViewModel())
}
