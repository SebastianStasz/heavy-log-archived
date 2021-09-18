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
