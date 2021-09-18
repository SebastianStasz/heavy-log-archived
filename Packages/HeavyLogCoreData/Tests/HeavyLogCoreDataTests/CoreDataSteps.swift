//
//  CoreDataSteps.swift
//  HeavyLogCoreDataTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import CoreData
import SwiftUI
import XCTest
@testable import HeavyLogCoreData

protocol CoreDataSteps {
    var context: NSManagedObjectContext { get set }
}

extension CoreDataSteps {

    func createWorkoutEntity(workoutData: WorkoutData, efforts: [EffortData] = []) -> WorkoutEntity {
        var workoutData = workoutData
        workoutData.efforts = efforts
        return WorkoutEntity.create(in: context, workoutData: workoutData)
    }

    @discardableResult func createExerciseEntity(exerciseData: ExerciseData) throws -> ExerciseEntity {
        try XCTUnwrap(ExerciseEntity.create(in: context, exerciseData: exerciseData))
    }

    func createSetEntity(in effortEntity: EffortEntity, setData: SetData) throws -> SetEntity {
        try XCTUnwrap(SetEntity.create(in: effortEntity, setData: setData))
    }

    func createEffortData(exerciseData: ExerciseData, setsData: [SetData]) throws -> EffortData {
        let exercise = try createExerciseEntity(exerciseData: exerciseData)
        return EffortData(exercise: exercise, sets: setsData)
    }

    // Create Effort Entity

    @discardableResult func createEffortEntity(in workoutEntity: WorkoutEntity, effortData: EffortData) throws -> EffortEntity {
        try XCTUnwrap(EffortEntity.create(in: workoutEntity, effortData: effortData))
    }

    @discardableResult func createEffortEntity(in workoutEntity: WorkoutEntity, exerciseData: ExerciseData, setsData: [SetData]) throws -> EffortEntity {
        let effortData = try createEffortData(exerciseData: exerciseData, setsData: setsData)
        return try createEffortEntity(in: workoutEntity, effortData: effortData)
    }

    @discardableResult func createEffortEntity(workoutData: WorkoutData, exerciseEntity: ExerciseEntity, setsData: [SetData]) throws -> EffortEntity {
        let effortData = EffortData(exercise: exerciseEntity, sets: setsData)
        let workoutEntity = createWorkoutEntity(workoutData: workoutData)
        return try createEffortEntity(in: workoutEntity, effortData: effortData)
    }

    @discardableResult func createEffortEntity(workoutData: WorkoutData, exerciseData: ExerciseData, setsData: [SetData]) throws -> EffortEntity {
        let effortData = try createEffortData(exerciseData: exerciseData, setsData: setsData)
        let workoutEntity = createWorkoutEntity(workoutData: workoutData)
        return try createEffortEntity(in: workoutEntity, effortData: effortData)
    }

    @discardableResult func fetchRequestShouldReturnElements<T: NSManagedObject>(_ amount: Int, for entity: T.Type) throws -> [T] {
        let request: NSFetchRequest<T> = T.createFetchRequest()
        let entities = try! context.fetch(request)
        XCTAssertEqual(entities.count, amount)
        return entities
    }

    @discardableResult  func customFetchRequestShouldReturnElements<T: NSManagedObject>(request: NSFetchRequest<T>, amount: Int, for entity: T.Type) throws -> [T] {
        let entities = try! context.fetch(request)
        XCTAssertEqual(entities.count, amount)
        return entities
    }

    func saveContext() throws {
        XCTAssert(savePreviewContext())
    }

    private func savePreviewContext() -> Bool {
        do {
            try context.save()
            return true
        }
        catch let error {
            print("Saving context error: \(error)")
            return false
        }
    }

    func createWorkoutTemplateEntity(exercises: [ExerciseEntity] = []) -> WorkoutTemplateEntity {
        WorkoutTemplateEntity.create(in: context, exercises: exercises)
    }
}
