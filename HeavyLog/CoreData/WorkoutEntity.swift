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
    @NSManaged private(set) var startDate: Date
    @NSManaged private(set) var endDate: Date
    @NSManaged private(set) var notes: String?
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
}

extension WorkoutEntity: Identifiable {}
