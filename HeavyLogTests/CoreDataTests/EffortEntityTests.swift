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
        // Before creating there should not be any efforts.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Create effort data.
        let effortData = try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Create workout entity using sample1 data.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1)

        // Create effort entity.
        let effortEntity = try createEffortEntity(in: workoutEntity, effortData: effortData)

        // After creating there should be one effort.
        try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Verify that effort entity data is correct.
        try verifyEffortEntityData(effortEntity, data: effortData, workout: workoutEntity)
    }

    func test_edit_effort_entity() throws {
        // Create workout entity using sample1 data.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1)

        // Create effort entity.
        let effort = try createEffortEntity(in: workoutEntity, exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Create effort data 2.
        let effortData2 = try createEffortData(exerciseData: .sampleClassicDeadlift, setsData: [.sample3])

        // Modify effort entity.
        effort.modify(effort: effortData2)

        // Verify that data has been changed.
        try verifyEffortEntityData(effort, data: effortData2, workout: workoutEntity)

        // Verify that only one set entity exists.
        try fetchRequestShouldReturnElements(1, for: SetEntity.self)
    }

    func test_delete_effort_entity() throws {
        // Create workout entity using sample1 data.
        let workout = createWorkoutEntity(workoutData: .sample1)

        // Create exercise entity.
        let exercise = try createExerciseEntity(exerciseData: .sampleBenchPress)

        // Create effort entity using sample1 data.
        let effort = try createEffortEntity(in: workout, effortData: .init(exercise: exercise))

        // Verify that effort entity was created.
        try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Delete effort entity
        effort.delete()

        // Verify that effort entity was deleted.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Verify that workout relatet to this entity still exist.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

        // Verify that workout relatet to this entity has no efforts.
        try workoutEffortsCountIsEqual(workout: workout, 0)
    }
}

// MARK: - Steps

extension EffortEntityTests {

    private func verifyEffortEntityData(_ effort: EffortEntity, data: Effort, workout: WorkoutEntity) throws {
        XCTAssertEqual(effort.workout, workout)
        XCTAssertEqual(effort.numberOfSets, data.sets.count)
    }

    private func workoutEffortsCountIsEqual(workout: WorkoutEntity, _ amount: Int) throws {
        XCTAssertEqual(workout.numberOfEfforts, amount)
    }
}
