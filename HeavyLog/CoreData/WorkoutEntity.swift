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
    @NSManaged private var rate_: String

    private(set) var rate: WorkoutRate {
        get { .getCase(for: rate_) }
        set { rate_ = newValue.rawValue }
    }
}

extension WorkoutEntity {
    static func createFetchRequest() -> NSFetchRequest<WorkoutEntity> {
        let request = NSFetchRequest<WorkoutEntity>(entityName: "WorkoutEntity")
        request.sortDescriptors = []
        request.predicate = nil
        return request
    }

    @discardableResult
    static func create(in context: NSManagedObjectContext, data: Workout) -> WorkoutEntity {
        let workout = WorkoutEntity(context: context)
        workout.startDate = data.startDate
        workout.modify(data: data)
        return workout
    }

    @discardableResult
    func modify(data: Workout) -> WorkoutEntity {
        title = data.title
        notes = data.notes
        endDate = data.endDate
        rate = data.rate
        return self
    }
}

extension WorkoutEntity: Identifiable {}
