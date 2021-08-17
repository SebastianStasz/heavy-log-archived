//
//  WorkoutEntityTests.swift
//  HeavyLogCoreDataTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import XCTest
@testable import HeavyLogCoreData

class WorkoutEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.preview.context
    }

    // MARK: - Tests

    func test_create_workout_entity() throws {
        // Define workout data.
        let workoutData = Workout.sample1

        // Before creating, there should not be any workouts.
        try fetchRequestShouldReturnElements(0, for: WorkoutEntity.self)

        // Define efforts data that will be used to create workout entity.
        let efforts = [try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2]),
                       try createEffortData(exerciseData: .sampleClassicDeadlift, setsData: [.sample3])]

        // Create workout entity.
        let workoutEntity = createWorkoutEntity(workoutData: workoutData, efforts: efforts)

        // After creating, there should be one workout.
        try fetchRequestShouldReturnElements(1, for: WorkoutEntity.self)

        // Two effort entities should also be created.
        let effortEntities = try fetchRequestShouldReturnElements(2, for: EffortEntity.self)

        // Verify that workout entity data is correct.
        try verifyWorkoutEntityData(workoutEntity, data: workoutData, efforts: effortEntities)

        // Save context.
        try saveContext()
    }

    func test_edit_exercise_entity() throws {
        // Define initial effort data.
        let initialEfforts = [try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1]),
                               try createEffortData(exerciseData: .sampleClassicDeadlift, setsData: [.sample2])]

        // Define initial workout data.
        let initialWorkoutData = Workout.sample1

        // Create workout entity using sample1 data and initial effort data.
        let workoutEntity = createWorkoutEntity(workoutData: initialWorkoutData, efforts: initialEfforts)

        // Define modified effort data.
        let modifiedEfforts = [try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2])]

        // Define modified workout data.
        var modifiedWorkoutData = Workout.sample2
        modifiedWorkoutData.efforts = modifiedEfforts

        // Modify workout entity using modified workout data.
        workoutEntity.modify(workoutData: modifiedWorkoutData)

        // After modification, one effort should exist.
        let effortEntities = try fetchRequestShouldReturnElements(1, for: EffortEntity.self)

        // Verify that data has been changed, start date should be the same.
        try verifyWorkoutEntityData(workoutEntity, data: .sample2, startDate: initialWorkoutData.startDate, efforts: effortEntities)

        // Save context.
        try saveContext()
    }

    func test_delete_workout_entity() throws {
        // Define efforts data that will be used to create workout entity.
        let efforts = [try createEffortData(exerciseData: .sampleBenchPress, setsData: [.sample1, .sample2]),
                       try createEffortData(exerciseData: .sampleClassicDeadlift, setsData: [.sample3])]

        // Create workout entity.
        let workoutEntity = createWorkoutEntity(workoutData: .sample1, efforts: efforts)

        // Delete workout entity.
        workoutEntity.delete()

        // Verify that workout entity was deleted.
        try fetchRequestShouldReturnElements(0, for: WorkoutEntity.self)

        // Verify that efforts relatet to this entity were deleted.
        try fetchRequestShouldReturnElements(0, for: EffortEntity.self)

        // Save context.
        try saveContext()
    }
}

// MARK: - Steps

extension WorkoutEntityTests {

    private func verifyWorkoutEntityData(_ workout: WorkoutEntity, data: Workout, startDate: Date? = nil, efforts: [EffortEntity]) throws {
        XCTAssertEqual(workout.title, data.title)
        XCTAssertEqual(workout.notes, data.notes)
        XCTAssertEqual(workout.rate, data.rate)
        XCTAssertEqual(workout.numberOfEfforts, efforts.count)
        XCTAssertEqual(workout.startDate, startDate ?? data.startDate )
        XCTAssertEqual(workout.endDate, data.endDate)

        for effort in efforts {
            XCTAssert(workout.efforts.contains(where: { $0.id == effort.id }))
        }
    }
}
