//
//  ChallengesViewModel.swift
//  808
//
//  Created by Роман on 03.09.2024.
//

import Foundation
import CoreData
import UIKit

final class ChallengesViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var challenges: [Challeng] = []
    
    @Published var simpleName = ""
    @Published var simpleDay = "10"
    @Published var simpleEmotion = UIImage(resource: .diary)
    
    @Published var isPresentAddChallenge = false
    
    init(){
        getChallenges()
    }
    
    //MARK: - Add Data
    func addChalleng(){
        let newChalleng = Challeng(context: manager.context)
        newChalleng.name = simpleName
        newChalleng.day = Int16(simpleDay) ?? 10
        newChalleng.emotion = simpleEmotion
        save()
        clear()
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
    }
    
    //MARK: - Save data
    func save(){
        challenges.removeAll()
        manager.save()
        getChallenges()
    }
}
