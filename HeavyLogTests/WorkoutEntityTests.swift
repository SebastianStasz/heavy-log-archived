//
//  WorkoutEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import XCTest
@testable import HeavyLog

class WorkoutEntityTests: XCTestCase {

    private var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.preview.context
    }

    override func tearDownWithError() throws {

    }

    // MARK: - Tests

    func test_create_workout_entity() throws {
        // Before creating there should not be any workouts.
        try workoutRequestShouldReturnElements(0)

        // Create workout entity.
        let workout = createWorkoutEntity(data: .sample1)

        // After creating there should be one workout.
        try workoutRequestShouldReturnElements(1)

        // Verify that workout entit data is correct.
        try verifyWorkoutEntityData(workout, data: .sample1)
    }

    func test_edit_exercise_entity() throws {
        // Create workout entity using sample1 data.
        let workout = createWorkoutEntity(data: .sample1)

        // Modify workout entity using sample2 data.
        workout.modify(data: .sample2)

        // Verify that data has been changed.
        try verifyWorkoutEntityData(workout, data: .sample2, startDate: Workout.sample1.startDate)
    }

    func test_delete_workout_entity() throws {
        // Create workout entity.
        let workout = createWorkoutEntity(data: .sample1)

        // Verify that exercworkoutise entity was created.
        try workoutRequestShouldReturnElements(1)

        // Delete workout entity
        workout.delete()

        // Verify that workout entity was deleted.
        try workoutRequestShouldReturnElements(0)
    }
}

// MARK: - Steps

extension WorkoutEntityTests {

    private func createWorkoutEntity(data: Workout) -> WorkoutEntity {
        WorkoutEntity.create(in: context, data: data)
    }

    private func workoutRequestShouldReturnElements(_ amount: Int) throws {
        let request = WorkoutEntity.createFetchRequest()
        let exercises = try! context.fetch(request)
        XCTAssertEqual(exercises.count, amount)
    }

    private func verifyWorkoutEntityData(_ workout: WorkoutEntity, data: Workout, startDate: Date? = nil) throws {
        XCTAssertEqual(workout.title, data.title)
        XCTAssertEqual(workout.notes, data.notes)
        XCTAssertEqual(workout.startDate, startDate ?? data.startDate )
        XCTAssertEqual(workout.endDate, data.endDate)
        XCTAssertEqual(workout.rate, data.rate)
    }
}
