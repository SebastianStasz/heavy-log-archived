//
//  SetEntity+CoreDataClass.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/08/2021.
//
//

import CoreData
import Foundation

@objc(SetEntity) public class SetEntity: NSManagedObject {

    @NSManaged private(set) var reps: Int
    @NSManaged private(set) var weight: Double
    @NSManaged private(set) var effort: EffortEntity
}

// MARK: - Methods

extension SetEntity {

    @discardableResult static func create(in effort: EffortEntity, workoutSet: WorkoutSet) -> SetEntity? {
        guard let context = effort.getContext() else { return nil }
        let set = SetEntity(in: context)
        set.effort = effort
        set.modify(workoutSet: workoutSet)
        return set
    }

    @discardableResult func modify(workoutSet: WorkoutSet) -> SetEntity {
        reps = workoutSet.reps
        weight = workoutSet.weight
        return self
    }

    // MARK: - Helpers
}

extension SetEntity: Identifiable {}
