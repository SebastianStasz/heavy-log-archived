//
//  EffortEntity+CoreDataClass.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation

@objc(EffortEntity) public class EffortEntity: NSManagedObject {

    @NSManaged private(set) var exerciseId: Int
    @NSManaged private(set) var exercise: ExerciseEntity
    @NSManaged private(set) var workout: WorkoutEntity
    @NSManaged private(set) var sets: [SetEntity]
}

// MARK: - Methods

extension EffortEntity {

    @discardableResult static func create(in workout: WorkoutEntity, effortData: Effort) -> EffortEntity? {
        guard let context = workout.getContext() else { return nil }
        let effort = EffortEntity(in: context)
        effort.workout = workout
        effort.modify(effort: effortData)
        return effort
    }

    @discardableResult func modify(effort: Effort) -> EffortEntity {
        exercise = effort.exercise
        exerciseId = effort.exerciseId
        addSets(effort.sets)
        return self
    }

    // MARK: - Helpers

    private func addSets(_ sets: [WorkoutSet]) {
        clearSets()
        _ = sets.map { addSet($0) }
    }

    private func clearSets() {
        _ = sets.map { $0.delete() }
    }

    private func addSet(_ workoutSet: WorkoutSet) {
        SetEntity.create(in: self, workoutSet: workoutSet)
    }
}

extension EffortEntity: Identifiable {}
