//
//  WorkoutTemplateEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//
//

import CoreData
import Foundation
import SwiftUI

@objc(WorkoutTemplateEntity) public class WorkoutTemplateEntity: NSManagedObject {

    @NSManaged public private(set) var name: String
    @NSManaged private(set) var lastUse: Date?
    @NSManaged private(set) var timesUsed: Int64
    @NSManaged public private(set) var exercises: Set<ExerciseEntity>
}

// MARK: - Methods

public extension WorkoutTemplateEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, data: WorkoutTemplateData) -> WorkoutTemplateEntity {
        let template = WorkoutTemplateEntity(in: context)
        template.modify(using: data)
        template.timesUsed = Int64(data.timesUsed)
        template.lastUse = data.lastUse
        return template
    }

    func modify(using data: WorkoutTemplateData) {
        self.exercises = Set(data.exercises)
        self.name = data.name
    }

    func wasUsed() {
        self.timesUsed += 1
        self.lastUse = Date()
    }

    // MARK: - Fetch Requests

    static func getRecentlyUsedTemplates(from context: NSManagedObjectContext, upTo quantity: Int) -> [WorkoutTemplateEntity]? {
        let request: NSFetchRequest<WorkoutTemplateEntity> = WorkoutTemplateEntity.nsFetchRequest(sortDescriptors: [recentlyUsed])
        request.fetchLimit = quantity
        return try? context.fetch(request)
    }

    // MARK: - Sort Descriptors

    static var recentlyUsed: NSSortDescriptor {
        NSSortDescriptor(key: "lastUse", ascending: false)
    }
}

// MARK: - Helpers

extension WorkoutTemplateEntity {

    @objc(addExercisesObject:)
    @NSManaged func addToExercises(_ value: ExerciseEntity)

    @objc(removeExercisesObject:)
    @NSManaged func removeFromExercises(_ value: ExerciseEntity)

    @objc(addExercises:)
    @NSManaged func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged func removeFromExercises(_ values: NSSet)

}

extension WorkoutTemplateEntity : Identifiable {}
