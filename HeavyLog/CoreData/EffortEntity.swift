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

    @NSManaged private(set) var exerciseId: Int
    @NSManaged private(set) var exercise: ExerciseEntity
    @NSManaged private(set) var workout: WorkoutEntity
}

extension EffortEntity {

    @discardableResult
    static func create(in workout: WorkoutEntity, data: Effort) -> EffortEntity? {
        guard let context = workout.getContext() else { return nil }
        let effort = EffortEntity(in: context)
        effort.workout = workout
        effort.modify(data: data)
        return effort
    }

    @discardableResult
    func modify(data: Effort) -> EffortEntity {
        exercise = data.exercise
        exerciseId = data.exerciseId
        return self
    }
}

extension EffortEntity: Identifiable {}
