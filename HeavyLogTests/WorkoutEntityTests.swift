//
//  WorkoutEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import XCTest
@testable import HeavyLog

class WorkoutEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.preview.context
    }

    override func tearDownWithError() throws {

    }

    // MARK: - Tests

    func test_create_workout_entity() throws {
        // Before creating there should not be any workouts.
        try fetchRequestShouldReturnElements(0, for: WorkoutEntity.self)

        // Create workout entity.
        let workout = createWorkoutEntity(data: .sample1)

        // After creating there should be one workout.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

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

        // Create exercise entity.
        let exercise = try createExerciseEntity(data: .sampleBenchPress)

        // Add effort to workout.
        try createEffortEntity(in: workout, data: .init(exercise: exercise))

        // Verify that workout entity was created.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

        // Delete workout entity.
        workout.delete()

        // Verify that workout entity was deleted.
        try fetchRequestShouldReturnElements(0, for: WorkoutEntity.self)

        // Verify that efforts relatet to this entity were deleted.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)
    }
}

// MARK: - Steps

extension WorkoutEntityTests {

    private func verifyWorkoutEntityData(_ workout: WorkoutEntity, data: Workout, startDate: Date? = nil) throws {
        XCTAssertEqual(workout.title, data.title)
        XCTAssertEqual(workout.notes, data.notes)
        XCTAssertEqual(workout.rate, data.rate)
        XCTAssertEqual(workout.efforts.count, data.efforts.count)
        XCTAssertEqual(workout.startDate, startDate ?? data.startDate )
        XCTAssertEqual(workout.endDate, data.endDate)
    }
}
