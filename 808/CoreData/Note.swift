//
//  Note+CoreDataProperties.swift
//
//
//  Created by Роман on 05.09.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note:NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var descriptionNote: String?
    @NSManaged public var emotion: UIImage?
    @NSManaged public var title: String?

}

extension Note : Identifiable {

}
