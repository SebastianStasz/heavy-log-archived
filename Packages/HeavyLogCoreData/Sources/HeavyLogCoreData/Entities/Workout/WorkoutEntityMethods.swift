//
//  WorkoutEntityMethods.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import CoreData
import Foundation

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

    static func getAll(from context: NSManagedObjectContext) -> [WorkoutEntity]? {
        let request: NSFetchRequest<WorkoutEntity> = WorkoutEntity.nsFetchRequest(sortDescriptors: [Sort.byDate(.forward).asNSSortDescriptor])
        return try? context.fetch(request)
    }
}

// MARK: - Helpers

private extension WorkoutEntity {

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

private extension WorkoutEntity {

    @objc(addEffortsObject:)
    @NSManaged func addToEfforts(_ value: EffortEntity)

    @objc(removeEffortsObject:)
    @NSManaged func removeFromEfforts(_ value: EffortEntity)

    @objc(addEfforts:)
    @NSManaged func addToEfforts(_ values: NSSet)

    @objc(removeEfforts:)
    @NSManaged func removeFromEfforts(_ values: NSSet)
}
