//
//  Challeng+CoreDataProperties.swift
//
//
//  Created by Роман on 03.09.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Challeng)
public class Challeng: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Challeng> {
        return NSFetchRequest<Challeng>(entityName: "Challeng")
    }

    @NSManaged public var comleted: Bool
    @NSManaged public var day: Int16
    @NSManaged public var dayEnd: Int16
    @NSManaged public var emotion: UIImage?
    @NSManaged public var name: String?

}

extension Challeng : Identifiable {

}
