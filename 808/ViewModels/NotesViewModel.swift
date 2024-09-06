//
//  NotesViewModel.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import Foundation
import CoreData
import UIKit

final class NotesViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var notes:[Note] = []
    @Published var simpleNote: Note!
    
    @Published var simpleTitle = ""
    @Published var simpleDescription = ""
    @Published var simpleEmotion = EmotionNotes.heart.image
    
    @Published var isPresentAddNote = false
    @Published var isPresentNote = false
    
    @Published var selectedView = 1
    
    @Published var editMode = false
    
    init(){
        getNotes()
    }
    
    //MARK: - Edit data
    func fillData(){
        simpleTitle = simpleNote.title ?? ""
        simpleDescription = simpleNote.descriptionNote ?? ""
    }
    
    func saveEdit(){
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do{
            notes = try manager.context.fetch(request)
            let note = notes.first(where: {$0.id == simpleNote.id})
            note?.title = simpleTitle
            note?.descriptionNote = simpleDescription
            note?.emotion = UIImage(resource: simpleEmotion)
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
        save()
        clear()
        isPresentAddNote.toggle()
        editMode = false
    }
    
    //MARK: - Delete data
    func deleteNote(){
        manager.context.delete(simpleNote)
        isPresentNote.toggle()
        save()
    }
    
    func deleteAll(){
        for note in notes {
            manager.context.delete(note)
        }
        save()
    }
    
    //MARK: - Add data
    func addNote(){
        let newNote = Note(context: manager.context)
        newNote.title = simpleTitle
        newNote.descriptionNote = simpleDescription
        newNote.emotion = UIImage(resource: simpleEmotion)
        save()
        clear()
        isPresentAddNote.toggle()
    }
    
    //MARK: - Get data
    func getNotes(){
        let request = NSFetchRequest<Note>(entityName: "Note")
        
        do{
            notes = try manager.context.fetch(request)
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
    }
    

    
    //MARK: - Save data
    func save(){
        notes.removeAll()
        manager.save()
        getNotes()
    }
    
    //MARK: - Clear data
    func clear(){
        simpleTitle = ""
        simpleDescription = ""
        simpleEmotion = EmotionNotes.heart.image
    }
}
