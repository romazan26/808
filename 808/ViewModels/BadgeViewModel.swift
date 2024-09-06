//
//  BadgeViewModel.swift
//  808
//
//  Created by Роман on 05.09.2024.
//

import Foundation
import CoreData

final class BadgeViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var badges: [Badge] = []
    @Published var simpleBadge = Badges.first
    
    @Published var isPresentInfo = false
    
    init(){
        getBadges()
        if badges.isEmpty {addBadges()}
    }
    
    func getDayAfterStrart() -> Int{
        let dateDiff = Calendar.current.dateComponents([.day], from: badges.first?.dayStart ?? Date(), to: Date()).day ?? 0
        return dateDiff
    }
    
    //MARK: - Delete
    func deleteAll(){
        for badge in badges {
            manager.context.delete(badge)
        }
        save()
    }
    
    //MARK: - getCountBadge
    func countBadge() -> Int{
        var count = 0
        if badges.first?.countCompleted == 0{
            count = 0
        } else if (badges.first?.countCompleted)! < 5{
            count = 1
        } else if (badges.first?.countCompleted)! < 10{
            count = 2
        }
        else if (badges.first?.countCompleted)! < 15{
            count = 3
        }else if (badges.first?.countCompleted)! < 20{
            count = 4
        }else if (badges.first?.countCompleted)! < 25{
            count = 5
        }else if (badges.first?.countCompleted)! > 25{
            count = 6
        }
        return count
    }
    
    //MARK: - Edit data
    func oneMoreComleted(){
        let request = NSFetchRequest<Badge>(entityName: "Badge")
        
        do{
            badges = try manager.context.fetch(request)
            let badge = badges.first
            badge?.countCompleted += 1
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Add data
    func addBadges(){
        let newbadge = Badge(context: manager.context)
        newbadge.countCompleted = 0
        newbadge.dayStart = Date()
        save()
    }
    
    //MARK: - Get data
    func getBadges(){
        let request = NSFetchRequest<Badge>(entityName: "Badge")
        
        do{
            badges = try manager.context.fetch(request)
        }catch let error {
            print("Error fetch coreData: \(error.localizedDescription)")
        }
    }
    

    
    //MARK: - Save data
    func save(){
        badges.removeAll()
        manager.save()
        getBadges()
    }
    
}
