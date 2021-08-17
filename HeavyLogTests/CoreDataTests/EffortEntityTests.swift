//
//  EffortEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import XCTest
@testable import HeavyLog

class EffortEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.preview.context
    }

    // MARK: - Tests

    func test_create_effort_entity() throws {
        // Before creating, there should not be any efforts.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Create workout entity, that will be used to create effort entity.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1)

        // Define effort data.
        let effortData = try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Create effort entity using defined effort data.
        let effortEntity = try createEffortEntity(in: workoutEntity, effortData: effortData)

        // After creating, there should be one effort.
        try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Two set entities should also be created.
        let setEntities = try fetchRequestShouldReturnElements(2, for: SetEntity.self)

        // Exercise entity should also be created.
        let exerciseEntity = try XCTUnwrap(try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self).first)

        // Verify that effort entity data is correct.
        try verifyEffortEntityData(effortEntity, data: effortData, workout: workoutEntity, setEntities: setEntities)

        // Verify effort entity is related to exercise entity.
        XCTAssert(exerciseEntity.efforts.contains(effortEntity))

        // Verify effort entity is related to workout entity.
        XCTAssert(workoutEntity.efforts.contains(effortEntity))

        // Save context.
        try saveContext()
    }

    func test_edit_effort_entity() throws {
        // Create workout entity, that will be used to create effort entity.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1)

        // Create effort entity.
        let effortEntity = try createEffortEntity(in: workoutEntity, exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Define modified effort data.
        let modifiedEffortData = try createEffortData(exerciseData: .sampleClassicDeadlift, setsData: [.sample3])

        // Modify effort entity using modified effort data.
        effortEntity.modify(effort: modifiedEffortData)

        // One set entity should exist.
        let setEntities = try fetchRequestShouldReturnElements(1, for: SetEntity.self)

        // Two exercises should exist.
        let exercises = try fetchRequestShouldReturnElements(2, for: ExerciseEntity.self)

        // Get access to exercises.
        let initialExercise = try XCTUnwrap(exercises.first(where: { $0.name == Exercise.sampleBenchPress.name }))
        let modifiedExercise = try XCTUnwrap(exercises.first(where: { $0.name == Exercise.sampleClassicDeadlift.name }))

        // Verify that data has been changed.
        try verifyEffortEntityData(effortEntity, data: modifiedEffortData, workout: workoutEntity, setEntities: setEntities)

        // Verify effort entity is related to modified exercise entity.
        XCTAssert(modifiedExercise.efforts.contains(effortEntity))

        // Verify initial exercise entity is not related to any efforts.
        XCTAssert(initialExercise.efforts.isEmpty)

        // Save context.
        try saveContext()
    }

    func test_delete_effort_entity() throws {
        // Create workout entity, that will be used to create effort entity.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1)

        // Create effort entity.
        let effortEntity = try createEffortEntity(in: workoutEntity, exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Delete effort entity
        effortEntity.delete()

        // Verify that effort entity was deleted.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Verify that sets related to this entity were deleted.
        try fetchRequestShouldReturnElements(0, for: SetEntity.self)

        // Verify that workout related to this entity still exist.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

        // Verify that exercise related to this entity still exist.
        let exerciseEntity = try XCTUnwrap(try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self).first)

        // Verify that workout related to this entity has no efforts.
        XCTAssert(workoutEntity.efforts.isEmpty)

        // Verify that exercise related to this entity has no efforts.
        XCTAssert(exerciseEntity.efforts.isEmpty)

        // Save context.
        try saveContext()
    }
}

// MARK: - Steps

extension EffortEntityTests {

    private func verifyEffortEntityData(_ effort: EffortEntity, data: Effort, workout: WorkoutEntity, setEntities: [SetEntity]) throws {
        XCTAssertEqual(effort.workout, workout)
        XCTAssertEqual(effort.exercise, data.exercise)
        XCTAssertEqual(effort.exerciseId, data.exerciseId)
        XCTAssertEqual(effort.numberOfSets, data.sets.count)
        for set in setEntities {
            XCTAssert(effort.sets.contains(where: { $0.id == set.id }))
        }
    }
}
