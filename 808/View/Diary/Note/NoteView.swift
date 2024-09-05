//
//  NoteView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct NoteView: View {
    @StateObject var vm: NotesViewModel
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
            VStack {
                //MARK: - Title
                Text(vm.simpleNote.title ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17, weight: .bold))
                
                //MARK: - Discription
                Text(vm.simpleNote.descriptionNote ?? "")
                    .foregroundStyle(.white)
                    .font(.system(size: 17))
                    .padding(.top)
                
                //MARK: - Emotion
                HStack{
                    Spacer()
                    Image(uiImage: vm.simpleNote.emotion ?? UIImage(resource: .sad))
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                Spacer()
                
                //MARK: - Button
                HStack{
                    Button(action: {vm.deleteNote()}, label: {
                        BlueButtonView(text: "Delete", backGrouund: .pink)
                    })
                    Button(action: {
                        vm.isPresentAddNote.toggle()
                        vm.fillData()
                        vm.editMode.toggle()
                    }, label: {
                        BlueButtonView(text: "Edit")
                    })
                }
            }
            .sheet(isPresented: $vm.isPresentAddNote, content: {
                AddNoteView(vm: vm)
            })
            .padding()
        }
    }
}

//#Preview {
//    NoteView(vm: NotesViewModel())
//}
