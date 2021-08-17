//
//  CoreDataSteps.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import CoreData
import XCTest
@testable import HeavyLog

protocol CoreDataSteps {
    var context: NSManagedObjectContext { get set }
}

extension CoreDataSteps {

    func createWorkoutEntity(workoutData: Workout, efforts: [Effort] = []) -> WorkoutEntity {
        var workoutData = workoutData
        workoutData.efforts = efforts
        return WorkoutEntity.create(in: context, workoutData: workoutData)
    }

    func createExerciseEntity(exerciseData: Exercise) throws -> ExerciseEntity {
        try XCTUnwrap(ExerciseEntity.create(in: context, exerciseData: exerciseData))
    }

    func createSetEntity(in effortEntity: EffortEntity, setData: WorkoutSet) throws -> SetEntity {
        try XCTUnwrap(SetEntity.create(in: effortEntity, setData: setData))
    }

    func createEffortData(exerciseData: Exercise, setsData: [WorkoutSet]) throws -> Effort {
        let exercise = try createExerciseEntity(exerciseData: exerciseData)
        return Effort(exercise: exercise, sets: setsData)
    }

    // Create Effort Entity

    @discardableResult func createEffortEntity(in workoutEntity: WorkoutEntity, effortData: Effort) throws -> EffortEntity {
        try XCTUnwrap(EffortEntity.create(in: workoutEntity, effortData: effortData))
    }

    @discardableResult func createEffortEntity(in workoutEntity: WorkoutEntity, exerciseData: Exercise, setsData: [WorkoutSet]) throws -> EffortEntity {
        let effortData = try createEffortData(exerciseData: exerciseData, setsData: setsData)
        return try createEffortEntity(in: workoutEntity, effortData: effortData)
    }

    @discardableResult func createEffortEntity(workoutData: Workout, exerciseEntity: ExerciseEntity, setsData: [WorkoutSet]) throws -> EffortEntity {
        let effortData = Effort(exercise: exerciseEntity, sets: setsData)
        let workoutEntity = createWorkoutEntity(workoutData: workoutData)
        return try createEffortEntity(in: workoutEntity, effortData: effortData)
    }

    @discardableResult func createEffortEntity(workoutData: Workout, exerciseData: Exercise, setsData: [WorkoutSet]) throws -> EffortEntity {
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
}
