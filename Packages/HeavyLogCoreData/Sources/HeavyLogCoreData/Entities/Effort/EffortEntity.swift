//
//  EffortEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation

@objc(EffortEntity) public class EffortEntity: NSManagedObject {

    @NSManaged private(set) var exerciseId: Int
    @NSManaged public private(set) var exercise: ExerciseEntity
    @NSManaged private(set) var workout: WorkoutEntity
    @NSManaged public private(set) var sets: Set<SetEntity>

    public var numberOfSets: Int {
        sets.count
    }

    public var exerciseName: String {
        exercise.name
    }
}

// MARK: - Methods

extension EffortEntity {

    @discardableResult static func create(in workoutEntity: WorkoutEntity, effortData: EffortData) -> EffortEntity? {
        guard let context = workoutEntity.getContext() else { return nil }
        let effort = EffortEntity(in: context)
        effort.workout = workoutEntity
        effort.modify(effort: effortData)
        return effort
    }

    @discardableResult func modify(effort: EffortData) -> EffortEntity {
        exercise = effort.exercise
        exerciseId = effort.exerciseId
        deleteAllSets()
        addSets(effort.sets)
        return self
    }

    var codingData: EffortData.Coding {
        .init(exerciseId: exerciseId, exerciseName: exercise.name, sets: sets.map { $0.data })
    }

    // MARK: - Helpers

    private func addSets(_ sets: [SetData]) {
        for set in sets { addSet(set) }
    }

    private func deleteAllSets() {
        for set in sets {
            removeFromSets(set)
            set.delete()
        }
    }

    private func addSet(_ workoutSet: SetData) {
        SetEntity.create(in: self, setData: workoutSet)
    }
}

extension EffortEntity {

    @objc(addSetsObject:)
    @NSManaged func addToSets(_ value: SetEntity)

    @objc(removeSetsObject:)
    @NSManaged func removeFromSets(_ value: SetEntity)

    @objc(addSets:)
    @NSManaged func addToSets(_ values: NSSet)

    @objc(removeSets:)
    @NSManaged func removeFromSets(_ values: NSSet)
}

extension EffortEntity: Identifiable {}
