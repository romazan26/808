//
//  NotesView.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import SwiftUI

struct NotesView: View {
    @StateObject var vm: NotesViewModel
    var body: some View {
        VStack {
            //MARK: - List notes
            if vm.notes.isEmpty{
                EmptyNotes()
            }else{
                ScrollView{
                    ForEach(vm.notes) { note in
                        Button(action: {
                            vm.simpleNote = note
                            vm.isPresentNote.toggle()
                        }, label: {
                            NoteCellView(note: note)
                        })
                        
                    }
                }
            }
            Spacer()
            
            //MARK: - Add note button
            Button(action: {vm.isPresentAddNote.toggle()}, label: {
                BlueButtonView(text: "Add a new entry", image: "plus.circle")
            })
            
        }
        .sheet(isPresented: $vm.isPresentNote, content: {
            NoteView(vm: vm)
        })
    }
}

#Preview {
    NotesView(vm: NotesViewModel())
}
