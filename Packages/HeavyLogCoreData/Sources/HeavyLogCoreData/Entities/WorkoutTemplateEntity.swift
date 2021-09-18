//
//  WorkoutTemplateEntity.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//
//

import Foundation
import CoreData

@objc(WorkoutTemplateEntity) public class WorkoutTemplateEntity: NSManagedObject {

    @NSManaged private(set) var lastUse: Date?
    @NSManaged private(set) var timesUsed: Int64
    @NSManaged private(set) var exercises: Set<ExerciseEntity>
}

// MARK: - Methods

public extension WorkoutTemplateEntity {

    @discardableResult static func create(in context: NSManagedObjectContext, exercises: [ExerciseEntity]) -> WorkoutTemplateEntity {
        let template = WorkoutTemplateEntity(in: context)
        template.modify(exercises: exercises)
        template.timesUsed = 0
        template.lastUse = nil
        return template
    }

    func modify(exercises: [ExerciseEntity]) {
        self.exercises = Set(exercises)
    }

    func wasUsed() {
        self.timesUsed += 1
        self.lastUse = Date()
    }

    static func getRecentlyUsedTemplates(from context: NSManagedObjectContext, amount: Int) -> [WorkoutTemplateEntity]? {
        let request: NSFetchRequest<WorkoutTemplateEntity> = WorkoutTemplateEntity.createFetchRequest(sortDescriptors: [recentlyUsed])
        request.fetchLimit = amount
        return try? context.fetch(request)
    }

    private static var recentlyUsed: NSSortDescriptor {
        NSSortDescriptor(key: "lastUse", ascending: false)
    }
}

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
