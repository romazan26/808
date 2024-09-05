//
//  NoteCellView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct NoteCellView: View {
    @ObservedObject var note: Note
    var body: some View {
        ZStack {
            Color.second.cornerRadius(20)
            VStack {
                HStack {
                    //MARK: - Emotion
                    Image(uiImage: note.emotion ?? UIImage(resource: .smile))
                        .resizable()
                        .frame(width: 24, height: 24)
                    //MARK: - title note
                    Text(note.title ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                //MARK: - Discription note
                Text(note.descriptionNote ?? "")
                    .foregroundStyle(.gray)
                    .font(.system(size: 13))
                Spacer()
            }.padding()
        }.frame(width: .infinity, height: 124)
    }
}

//#Preview {
//    NoteCellView()
//}
