//
//  WorkoutEntity+CoreDataClass.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//
//

import CoreData
import Foundation
import SwiftUI

@objc(WorkoutEntity) public class WorkoutEntity: NSManagedObject {

    @NSManaged public private(set) var title: String
    @NSManaged public private(set) var startDate: Date
    @NSManaged public private(set) var endDate: Date
    @NSManaged public private(set) var notes: String?
    @NSManaged public private(set) var efforts: Set<EffortEntity>
    @NSManaged private var rate_: String

    public private(set) var rate: WorkoutRate {
        get { .getCase(for: rate_) }
        set { rate_ = newValue.rawValue }
    }

    public var numberOfEfforts: Int {
        efforts.count
    }

    public var duration: String {
        startDate.distance(to: endDate).asHoursAndMinutes
    }
}

// MARK: - Methods

public extension WorkoutEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, workoutData: WorkoutData) -> WorkoutEntity {
        let workout = WorkoutEntity(in: context)
        workout.startDate = workoutData.startDate
        workout.modify(workoutData: workoutData)
        return workout
    }

    @discardableResult func modify(workoutData workout: WorkoutData) -> WorkoutEntity {
        title = workout.title
        notes = workout.notes
        endDate = workout.endDate
        rate = workout.rate
        deleteEfforts()
        addEfforts(workout.efforts)
        return self
    }

    static func getAllWorkoutsCodableData(from context: NSManagedObjectContext) -> [WorkoutData.Coding]? {
        WorkoutEntity.getAll(from: context)?.compactMap { $0.codingData }
    }

    // MARK: - Fetch Requests

    static var all: FetchRequest<WorkoutEntity> {
        WorkoutEntity.createFetchRequest(sortDescriptors: [sortByDate])
    }

    static func getAll(from context: NSManagedObjectContext) -> [WorkoutEntity]? {
        let request: NSFetchRequest<WorkoutEntity> = WorkoutEntity.createFetchRequest(sortDescriptors: [sortByDate])
        return try? context.fetch(request)
    }

    private static var sortByDate: NSSortDescriptor {
        NSSortDescriptor(key: "endDate", ascending: false)
    }

    // MARK: - Helpers

    private func addEfforts(_ efforts: [EffortData]) {
        for effort in efforts { addEffort(effort) }
    }

    private func deleteEfforts() {
        for effort in efforts {
            removeFromEfforts(effort)
            effort.delete()
        }
    }

    private func addEffort(_ effort: EffortData) {
        EffortEntity.create(in: self, effortData: effort)
    }

    private var codingData: WorkoutData.Coding {
        WorkoutData.Coding(title: title, notes: notes, startDate: startDate, endDate: endDate, efforts: efforts.map { $0.codingData }, rate: rate)
    }
}

extension WorkoutEntity {

    @objc(addEffortsObject:)
    @NSManaged func addToEfforts(_ value: EffortEntity)

    @objc(removeEffortsObject:)
    @NSManaged func removeFromEfforts(_ value: EffortEntity)

    @objc(addEfforts:)
    @NSManaged func addToEfforts(_ values: NSSet)

    @objc(removeEfforts:)
    @NSManaged func removeFromEfforts(_ values: NSSet)
}

extension WorkoutEntity: Identifiable {}
