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

extension WorkoutEntity {

    @discardableResult
    static func create(in context: NSManagedObjectContext, data: Workout) -> WorkoutEntity {
        let workout = WorkoutEntity(in: context)
        workout.startDate = data.startDate
        workout.modify(data: data)
        return workout
    }

    @discardableResult
    func modify(data: Workout) -> WorkoutEntity {
        deleteEfforts()
        createEfforts(data.efforts)
        title = data.title
        notes = data.notes
        endDate = data.endDate
        rate = data.rate
        return self
    }

    private func createEfforts(_ efforts: [Effort]) {
        for effort in efforts {
            EffortEntity.create(in: self, data: effort)
        }
    }

    private func deleteEfforts() {
        for effort in efforts {
            effort.delete()
        }
    }
}

extension WorkoutEntity: Identifiable {}
