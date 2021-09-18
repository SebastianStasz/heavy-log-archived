//
//  WorkoutTemplateEntityTests.swift
//  HeavyLogCoreDataTests
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//

import CoreData
import Shared
import XCTest
@testable import HeavyLogCoreData

class WorkoutTemplateEntityTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.previewEmpty.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.previewEmpty.context
    }

    // MARK: - Tests

    func test_create_workoutTemplate_entity() throws {
        // Before creating, there should not be any workout templates.
        try fetchRequestShouldReturnElements(0, for: WorkoutTemplateEntity.self)

        // Create exercise entities that will be used in workout template.
        let exerciseEntity1 = try createExerciseEntity(exerciseData: .sampleBenchPress)
        let exerciseEntity2 = try createExerciseEntity(exerciseData: .sampleClassicDeadlift)

        // Create workout template entity.
        let workoutTemplateEntity = createWorkoutTemplateEntity(exercises: [exerciseEntity1, exerciseEntity2])

        // After creating there should be one workout template.
        try fetchRequestShouldReturnElements(1, for: WorkoutTemplateEntity.self)

        // Verify that wokrout template entity data is correct.
        try verifyWorkoutTemplateEntityData(template: workoutTemplateEntity, exercises: [exerciseEntity1, exerciseEntity2])

        // Verify that each exercise entity relatet to this workout template entity has one template.
        XCTAssertEqual(exerciseEntity1.templates.count, 1)
        XCTAssertEqual(exerciseEntity2.templates.count, 1)

        // Save context.
        try saveContext()
    }

    func test_modify_workoutTemplate_entity() throws {
        // Create exercise entity that will be used in workout template.
        let exerciseEntity1 = try createExerciseEntity(exerciseData: .sampleBenchPress)

        // Create workout template entity.
        let workoutTemplateEntity = createWorkoutTemplateEntity(exercises: [exerciseEntity1])

        // Create exercise entity that will be used in modified workout template.
        let exerciseEntity2 = try createExerciseEntity(exerciseData: .sampleClassicDeadlift)

        // Modify workout template entity.
        workoutTemplateEntity.modify(exercises: [exerciseEntity2])

        // Verify that workout template data has been changed.
        try verifyWorkoutTemplateEntityData(template: workoutTemplateEntity, exercises: [exerciseEntity2])

        // Save context.
        try saveContext()
    }

    func test_workoutTemplate_wasUsed() throws {
        // Create exercise entity that will be used in workout template.
        let exerciseEntity1 = try createExerciseEntity(exerciseData: .sampleBenchPress)

        // Create workout template entity.
        let workoutTemplateEntity = createWorkoutTemplateEntity(exercises: [exerciseEntity1])

        // Perform workout template was used 3 times.
        _ = (0..<3).map { _ in workoutTemplateEntity.wasUsed() }

        // Verify that workout template data has been changed.
        try verifyWorkoutTemplateEntityData(template: workoutTemplateEntity, exercises: [exerciseEntity1], lastUsed: Date(), timesUsed: 3)

        // Save context.
        try saveContext()
    }

    func test_delete_workoutTemplate_entity() throws {
        // Create exercise entity that will be used in workout template.
        let exerciseEntity = try createExerciseEntity(exerciseData: .sampleBenchPress)

        // Create workout template entity.
        let workoutTemplateEntity = createWorkoutTemplateEntity(exercises: [exerciseEntity])

        // Delete set entity
        workoutTemplateEntity.delete()

        // Verify that set entity was deleted.
        try fetchRequestShouldReturnElements(0, for: WorkoutTemplateEntity.self)

        // Verify that exercise entity relatet to this workout template entity still exist.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Verify that exercise entity relatet to this workout template entity has no templates.
        XCTAssertEqual(exerciseEntity.templates.count, 0)

        // Save context.
        try saveContext()
    }

    func test_getRecentlyUsedTemplates() {
        // Create three workout template entities.
        let workoutTemplateEntity1 = createWorkoutTemplateEntity()
        let workoutTemplateEntity2 = createWorkoutTemplateEntity()
        let workoutTemplateEntity3 = createWorkoutTemplateEntity()

        // First use workoutTemplateEntity3.
        workoutTemplateEntity3.wasUsed()

        // Next use workoutTemplateEntity1.
        workoutTemplateEntity1.wasUsed()

        // Get two recently used workout templates.
        let result = WorkoutTemplateEntity.getRecentlyUsedTemplates(from: context, amount: 2)

        // Result should contain 2 workout templates.
        XCTAssertEqual(result?.count, 2)

        // Result should not contain workoutTemplateEntity2, because it was not used.
        XCTAssertFalse(result?.contains(workoutTemplateEntity2) ?? true)

        // At the first index should be workoutTemplateEntity1.
        XCTAssertEqual(result?[0], workoutTemplateEntity1)

        // At the second index should be workoutTemplateEntity3.
        XCTAssertEqual(result?[1], workoutTemplateEntity3)
    }

    func test_getRecentlyUsedTemplates_if_neither_has_been_used() {
        // Create three workout template entities.
        let _ = createWorkoutTemplateEntity()
        let _ = createWorkoutTemplateEntity()
        let _ = createWorkoutTemplateEntity()

        // Get two recently used workout templates.
        let result = WorkoutTemplateEntity.getRecentlyUsedTemplates(from: context, amount: 2)

        // Result should contain 2 workout templates.
        XCTAssertEqual(result?.count, 2)
    }
}

// MARK: - Steps

extension WorkoutTemplateEntityTests {

    private func verifyWorkoutTemplateEntityData(template: WorkoutTemplateEntity, exercises: [ExerciseEntity], lastUsed: Date? = nil, timesUsed: Int64 = 0) throws {
        XCTAssertEqual(template.lastUse.string(format: .medium), lastUsed.string(format: .medium))
        XCTAssertEqual(template.timesUsed, timesUsed)
        XCTAssertEqual(template.exercises.count, exercises.count)
        for exercise in template.exercises {
            XCTAssert(exercises.contains(exercise))
        }
    }
}
