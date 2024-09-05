//
//  AddNoteView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct AddNoteView: View {
    @StateObject var vm: NotesViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack(alignment: .leading) {
                //MARK: - Title view
                HStack {
                    Spacer()
                    Text("New entry")
                        .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                    Spacer()
                }
                
                //MARK: - Title note
                Text("Title")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                    .padding(.top, 30)
                MultiLineTF(txt: $vm.simpleTitle, placehold: "Text")
                    .frame(height: 58)
                    .background {
                        Color.second.cornerRadius(20)
                    }
                
                //MARK: - Discription note
                Text("Discription:")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                MultiLineTF(txt: $vm.simpleDescription, placehold: "Text")
                    .frame(height: 142)
                    .background {
                        Color.second.cornerRadius(20)
                    }
                
                //MARK: - Choose Emotion
                Text("Emotion:")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                HStack{
                    ForEach(EmotionNotes.allCases) { emotion in
                        Button(action: {vm.simpleEmotion = emotion.image}, label: {
                            ZStack(content: {
                                Color(vm.simpleEmotion == emotion.image ? .blueApp : .gray)
                                    .cornerRadius(8)
                                Image(emotion.image)
                                    .resizable()
                                    .frame(width: 32, height: 32)
                            }).frame(width: 40, height: 40)
                        })
                    }
                }
                
                Spacer()
                
                //MARK: - Save button
                Button(action: {
                    vm.editMode ? vm.saveEdit() :  vm.addNote()

                }, label: {
                    BlueButtonView(text: "Save", image: "checkmark")
                        .opacity(vm.simpleTitle.isEmpty ? 0.6 : 1)
                }).disabled(vm.simpleTitle.isEmpty ? true : false)
                
            }.padding()
        }
    }
}

#Preview {
    AddNoteView(vm: NotesViewModel())
}
