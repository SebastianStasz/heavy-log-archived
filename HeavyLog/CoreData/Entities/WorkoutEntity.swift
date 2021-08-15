//
//  WorkoutEntity+CoreDataClass.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import Foundation
import CoreData

@objc(WorkoutEntity)
public class WorkoutEntity: NSManagedObject {

    @NSManaged private(set) var title: String
    @NSManaged private(set) var notes: String?
    @NSManaged private(set) var startDate: Date
    @NSManaged private(set) var endDate: Date
    @NSManaged private(set) var efforts: [EffortEntity]
    @NSManaged private var rate_: String

    private(set) var rate: WorkoutRate {
        get { .getCase(for: rate_) }
        set { rate_ = newValue.rawValue }
    }
}

extension WorkoutEntity {

    @objc(addEffortsObject:)
    @NSManaged public func addToEfforts(_ value: EffortEntity)

    @objc(removeEffortsObject:)
    @NSManaged public func removeFromEfforts(_ value: EffortEntity)

    @objc(addEfforts:)
    @NSManaged public func addToEfforts(_ values: NSSet)

    @objc(removeEfforts:)
    @NSManaged public func removeFromEfforts(_ values: NSSet)

}

// MARK: - Methods

extension WorkoutEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, workoutData: Workout) -> WorkoutEntity {
        let workout = WorkoutEntity(in: context)
        workout.startDate = workoutData.startDate
        workout.modify(workout: workoutData)
        return workout
    }

    @discardableResult func modify(workout: Workout) -> WorkoutEntity {
        addEfforts(workout.efforts)
        title = workout.title
        notes = workout.notes
        endDate = workout.endDate
        rate = workout.rate
        return self
    }

    // MARK: - Helpers

    private func addEfforts(_ efforts: [Effort]) {
        clearEfforts()
        _ = efforts.map { addEffort($0) }
    }

    private func clearEfforts() {
        _ = efforts.map { $0.delete() }
    }

    private func addEffort(_ effort: Effort) {
        EffortEntity.create(in: self, effortData: effort)
    }
}

extension WorkoutEntity: Identifiable {}
