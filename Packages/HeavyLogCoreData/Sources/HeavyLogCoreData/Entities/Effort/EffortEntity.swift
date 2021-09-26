//
//  EffortEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation

@objc(EffortEntity) public class EffortEntity: NSManagedObject, Entity {

    @NSManaged var exerciseId: Int
    @NSManaged var workout: WorkoutEntity
    @NSManaged public internal(set) var exercise: ExerciseEntity
    @NSManaged public internal(set) var sets: Set<SetEntity>

    public var numberOfSets: Int {
        sets.count
    }

    public var exerciseName: String {
        exercise.name
    }
}

extension EffortEntity: Identifiable {}
