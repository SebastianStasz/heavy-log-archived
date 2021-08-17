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

    // MARK: - Tests

    func test_create_set_entity() throws {
        // Before creating there should not be any sets.
        try fetchRequestShouldReturnElements(0, for: SetEntity.self)

        // Create effort entity.
        let effort = try createEffortEntity(workoutData: .sample1, exerciseData: .sampleBenchPress, setsData: [])

        // Create set entity.
        let setEntity = try createSetEntity(in: effort, workoutSet: .sample1)

        // After creating there should be one set.
        try fetchRequestShouldReturnElements(1, for: SetEntity.self)

        // Verify that set entity data is correct.
        try verifySetEntityData(set: setEntity, effort: effort, workoutSet: .sample1)
    }

    func test_edit_set_entity() throws {
        // Create effort entity.
        let effortEntity = try createEffortEntity(workoutData: .sample1, exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])

        // Create set entity using sample1 data.
        let setEntity = try createSetEntity(in: effortEntity, workoutSet: .sample1)

        // Modify effort entity using sample2 data.
        setEntity.modify(workoutSet: .sample2)

        // Verify that data has been changed.
        try verifySetEntityData(set: setEntity, effort: effortEntity, workoutSet: .sample2)
    }

    func test_delete_set_entity() throws {
        // Create effort entity.
        let effortEntity = try createEffortEntity(workoutData: .sample1, exerciseData: .sampleBenchPress, setsData: [])

        // Create set entity.
        let setEntity = try createSetEntity(in: effortEntity, workoutSet: .sample1)

        // Verify that set entity was created.
        try fetchRequestShouldReturnElements(1, for: SetEntity.self)

        // Delete set entity
        setEntity.delete()

        // Verify that set entity was deleted.
        try fetchRequestShouldReturnElements(0, for: SetEntity.self)

        // Verify that effort relatet to this set entity still exist.
        try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Verify that effort entity relatet to this set entity has no sets.
        XCTAssertEqual(effortEntity.numberOfSets, 0)
    }
}

// MARK: - Steps

extension SetEntityTests {

    private func verifySetEntityData(set: SetEntity, effort: EffortEntity, workoutSet: WorkoutSet) throws {
        XCTAssertEqual(set.effort, effort)
        XCTAssertEqual(set.reps, workoutSet.reps)
        XCTAssertEqual(set.weight, workoutSet.weight)
    }
}

