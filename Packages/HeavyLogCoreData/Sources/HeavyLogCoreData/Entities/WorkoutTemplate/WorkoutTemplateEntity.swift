//
//  WorkoutTemplateEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//
//

import CoreData
import Foundation
import SwiftUI

@objc(WorkoutTemplateEntity) public class WorkoutTemplateEntity: NSManagedObject, Entity {

    @NSManaged var lastUse: Date?
    @NSManaged var timesUsed: Int64
    @NSManaged public internal(set) var name: String
    @NSManaged public internal(set) var exercises: Set<ExerciseEntity>
}

extension WorkoutTemplateEntity : Identifiable {}
