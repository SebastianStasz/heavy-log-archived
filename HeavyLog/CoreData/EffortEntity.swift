//
//  EffortEntity+CoreDataClass.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation

@objc(EffortEntity)
public class EffortEntity: NSManagedObject {

    @NSManaged private(set) var workout: WorkoutEntity
    @NSManaged private(set) var exercises: [ExerciseEntity]
}

extension EffortEntity {

    @discardableResult
    static func create(in workout: WorkoutEntity, data: Effort) -> EffortEntity? {
        guard let context = workout.getContext() else { return nil }
        let effort = EffortEntity(in: context)
        effort.workout = workout
        return effort
    }

    @discardableResult
    func modify(data: Effort) -> EffortEntity {
        exercises = data.exercises
        return self
    }
}

extension EffortEntity: Identifiable {}
