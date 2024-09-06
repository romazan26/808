//
//  ChallengesViewModel.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

final class ChallengesViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var challenges: [Challeng] = []
    @Published var simpleChellenge: Challeng!
    @Published var completedChallenges: [Challeng] = []
    
    @Published var simpleName = ""
    @Published var simpleDay = "10"
    @Published var simpleEmotion = Emotion.star
    @Published var simpleDayOff: Float = 0
    
    @Published var isPresentAddChallenge = false
    @Published var isPresentChallenge = false
    
    @Published var isEdit = false
    
    
    
    init(){
        getChallenges()
        getCompleted()
    }
    
    func getCompleted(){
        completedChallenges.removeAll()
        getChallenges()
        for challenge in challenges {
            if challenge.comleted{
                completedChallenges.append(challenge)
            }
        }
    }
    
    
    //MARK: - Cheack winnew
    func cheackWin() -> Bool{
        if simpleChellenge.day == simpleChellenge.dayEnd{
            DispatchQueue.main.async {
                self.completedChallenge()
            }
            
            return true
        }else {
            return false
        }
    }
    
    //MARK: - Delete data
    func delleteChallenge(){
        manager.context.delete(simpleChellenge)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.isPresentChallenge.toggle()
        }
        
        save()
        clear()
    }
    
    func delleteAll(){
        getChallenges()
        for challenge in challenges {
            manager.context.delete(challenge)
        }
        save()
    }
    
    //MARK: - Save edit to challenge
    func saveEdit(){
        isEdit = false
        editDayOff()
        clear()
    }
    
    //MARK: - Activeted edite mode
    func editMode(){
        simpleDayOff = Float(simpleChellenge.dayEnd) / Float(simpleChellenge.day)
        isEdit = true
    }
    
    //MARK: - Edit data
    func completedChallenge(){
        let request = NSFetchRequest<Challeng>(entityName: "Challeng")
        
        do{
            challenges = try manager.context.fetch(request)
            let challenge = challenges.first(where: {$0.id == simpleChellenge.id})
            challenge?.comleted = true
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
        save()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.getCompleted()
        }
        
    }
    
    func restartChallenge(){
        let request = NSFetchRequest<Challeng>(entityName: "Challeng")
        
        do{
            challenges = try manager.context.fetch(request)
            let challenge = challenges.first(where: {$0.id == simpleChellenge.id})
            challenge?.dayEnd = 0
            challenge?.comleted = false
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
        save()
    }
    
    func editDayOff(){
        let request = NSFetchRequest<Challeng>(entityName: "Challeng")
        
        do{
            challenges = try manager.context.fetch(request)
            let challenge = challenges.first(where: {$0.id == simpleChellenge.id})
            challenge?.dayEnd = Int16(simpleDayOff * Float(simpleChellenge.day))
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Add Data
    func addChalleng(){
        let newChalleng = Challeng(context: manager.context)
        newChalleng.name = simpleName
        newChalleng.day = Int16(simpleDay) ?? 10
        newChalleng.emotion = UIImage(resource: simpleEmotion.image) 
        save()
        clear()
        isPresentAddChallenge.toggle()
    }
    
    //MARK: - Get data
    func getChallenges(){
        let request = NSFetchRequest<Challeng>(entityName: "Challeng")
        
        do{
            challenges = try manager.context.fetch(request)
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear data
    func clear(){
        simpleName = ""
        simpleDay = "10"
        simpleDayOff = 0
    }
    
    //MARK: - Save data
    func save(){
        challenges.removeAll()
        manager.save()
        getChallenges()
    }
}
