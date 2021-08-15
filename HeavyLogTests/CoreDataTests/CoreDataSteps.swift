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

    func createWorkoutEntity(data: Workout) -> WorkoutEntity
}

extension CoreDataSteps {

    func createWorkoutEntity(data: Workout) -> WorkoutEntity {
        WorkoutEntity.create(in: context, workoutData: data)
    }

    @discardableResult
    func createEffortEntity(in workout: WorkoutEntity, data: Effort) throws -> EffortEntity {
        try XCTUnwrap(EffortEntity.create(in: workout, effortData: data))
    }

    func createExerciseEntity(data: Exercise) throws -> ExerciseEntity {
        try XCTUnwrap(ExerciseEntity.create(in: context, exerciseData: data))
    }

    func createSetEntity(in effort: EffortEntity, workoutSet: WorkoutSet) throws -> SetEntity {
        try XCTUnwrap(SetEntity.create(in: effort, workoutSet: workoutSet))
    }

    func fetchRequestShouldReturnElements<T: NSManagedObject>(_ amount: Int, for entity: T.Type) throws {
        let request: NSFetchRequest<T> = T.createFetchRequest()
        let entities = try! context.fetch(request)
        XCTAssertEqual(entities.count, amount)
    }

    func createEffortData(exercise: Exercise, sets: [WorkoutSet]) throws -> Effort {
        let exercise = try createExerciseEntity(data: exercise)
        return Effort(exercise: exercise, sets: sets)
    }

    @discardableResult func createEffortEntity(workoutData: Workout, effortData: Effort) throws -> EffortEntity {
        let workout = createWorkoutEntity(data: workoutData)
        return try XCTUnwrap(EffortEntity.create(in: workout, effortData: effortData))
    }

    @discardableResult func createEffortEntity(workoutData: Workout, exercise: Exercise, sets: [WorkoutSet]) throws -> EffortEntity {
        let effortData = try createEffortData(exercise: exercise, sets: sets)
        let workout = createWorkoutEntity(data: workoutData)
        return try XCTUnwrap(EffortEntity.create(in: workout, effortData: effortData))
    }
}
