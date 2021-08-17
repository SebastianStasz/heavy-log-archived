//
//  WorkoutEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import Foundation
import CoreData

@objc(WorkoutEntity)
public class WorkoutEntity: NSManagedObject {

    @NSManaged private(set) var title: String
    @NSManaged private(set) var startDate: Date
    @NSManaged private(set) var endDate: Date
    @NSManaged private(set) var notes: String?
    @NSManaged private(set) var efforts: Set<EffortEntity>
    @NSManaged private var rate_: String

    public private(set) var rate: WorkoutRate {
        get { .getCase(for: rate_) }
        set { rate_ = newValue.rawValue }
    }

    public var numberOfEfforts: Int {
        efforts.count
    }
}

// MARK: - Methods

extension WorkoutEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, workoutData: Workout) -> WorkoutEntity {
        let workout = WorkoutEntity(in: context)
        workout.startDate = workoutData.startDate
        workout.modify(workoutData: workoutData)
        return workout
    }

    @discardableResult func modify(workoutData workout: Workout) -> WorkoutEntity {
        title = workout.title
        notes = workout.notes
        endDate = workout.endDate
        rate = workout.rate
        deleteEfforts()
        addEfforts(workout.efforts)
        return self
    }

    // MARK: - Helpers

    private func addEfforts(_ efforts: [Effort]) {
        for effort in efforts { addEffort(effort) }
    }

    private func deleteEfforts() {
        for effort in efforts {
            removeFromEfforts(effort)
            effort.delete()
        }
    }

    private func addEffort(_ effort: Effort) {
        EffortEntity.create(in: self, effortData: effort)
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

extension WorkoutEntity: Identifiable {}
