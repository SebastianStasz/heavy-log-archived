//
//  ExerciseEntity+CoreDataClass.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//
//

import Foundation
import CoreData

@objc(ExerciseEntity)
public class ExerciseEntity: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseEntity> {
        NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var shortName: String?
    @NSManaged public var information: String?
    @NSManaged public var difficulty: Int16
    @NSManaged public var type: Int16

}

extension ExerciseEntity: Identifiable {}
