//
//  SetEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 15/08/2021.
//

import XCTest
@testable import HeavyLog

class SetEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.preview.context
    }

    override func tearDownWithError() throws {

    }

    // MARK: - Tests

    func test_create_set_entity() throws {
        // Before creating there should not be any sets.
        try fetchRequestShouldReturnElements(0, for: SetEntity.self)

        // Create exercise entity.
        let exercise = try createExerciseEntity(data: .sampleBenchPress)

        // Create effort data.
        let effortData = Effort(exercise: exercise)

        // Create effort entity.
        let effort = try createEffortEntity(workoutData: .sample1, effortData: effortData)

        // Create set entity.
        let workoutSet = try createSetEntity(in: effort, data: .sample1)

        // After creating there should be one set.
        try fetchRequestShouldReturnElements(1, for: SetEntity.self)

        // Verify that set entity data is correct.
        try verifySetEntityData(set: workoutSet, in: effort, data: .sample1)
    }

    func test_edit_effort_entity() throws {
        // Create exercise entity.
        let exercise = try createExerciseEntity(data: .sampleBenchPress)

        // Create effort data.
        let effortData = Effort(exercise: exercise)

        // Create effort entity.
        let effort = try createEffortEntity(workoutData: .sample1, effortData: effortData)

        // Create set entity.
        let workoutSet = try createSetEntity(in: effort, data: .sample1)

        // Modify effort entity using sample2 data.
        workoutSet.modify(workoutSet: .sample2)

        // Verify that data has been changed.
        try verifySetEntityData(set: workoutSet, in: effort, data: .sample2)
    }

    func test_delete_effort_entity() throws {
        // Create workout entity using sample1 data.
        let workout = createWorkoutEntity(data: .sample1)

        // Create exercise entity.
        let exercise = try createExerciseEntity(data: .sampleBenchPress)

        // Create effort entity using sample1 data.
        let effort = try createEffortEntity(in: workout, data: .init(exercise: exercise))

        // Verify that effort entity was created.
        try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Delete effort entity
        effort.delete()

        // Verify that effort entity was deleted.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Verify that workout relatet to this entity still exist.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

        // Verify that workout relatet to this entity has no efforts.
//        try workoutEffortsCountIsEqual(workout: workout, 0)
    }
}

// MARK: - Steps

extension SetEntityTests {

    private func verifySetEntityData(set: SetEntity, in effort: EffortEntity, data: WorkoutSet) throws {
        XCTAssertEqual(set.effort, effort)
        XCTAssertEqual(set.reps, data.reps)
        XCTAssertEqual(set.weight, data.weight)
    }
}

