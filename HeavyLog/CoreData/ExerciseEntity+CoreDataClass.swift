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
    @NSManaged private var difficulty_: String
    @NSManaged private var type_: String

    var difficulty: Difficulty {
        get { .init(rawValue: difficulty_)! }
        set { difficulty_ = newValue.rawValue }
    }

    var type: ExerciseType {
        get { .init(rawValue: type_)! }
        set { type_ = newValue.rawValue }
    }
}

extension ExerciseEntity: Identifiable {}
