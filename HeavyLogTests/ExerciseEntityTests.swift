//
//  ExerciseEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Combine
import XCTest
@testable import HeavyLog

class ExerciseEntityTests: XCTestCase, CoreDataSteps {

    private var cancellable: AnyCancellable?
    var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        cancellable = nil
        context = PersistenceController.preview.context
    }

    override func tearDownWithError() throws {

    }

    // MARK: - Tests

    func test_create_exercise_entity() throws {
        // Before creating there should not be exercises.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Create exercise entity.
        let exercise = createExerciseEntity(data: .sampleBenchPress)

        // After creating there should be one exercise.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Verify that exercise entit data is correct.
        try verifyExerciseEntityData(exercise, data: .sampleBenchPress)
    }

    func test_edit_exercise_entity() throws {
        // Create exercise entity using bench press data.
        let exercise = createExerciseEntity(data: .sampleBenchPress)

        // Modify exercise entity using classic deadlift data.
        exercise.modify(data: .sampleClassicDeadlift)

        // Verify that data has been changed.
        try verifyExerciseEntityData(exercise, data: .sampleClassicDeadlift)
    }

    func test_delete_exercise_entity() throws {
        // Create exercise entity.
        let exercise = createExerciseEntity(data: .sampleClassicDeadlift)

        // Verify that exercise entity was created.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Delete exercise entity
        exercise.delete()

        // Verify that exercise entity was deleted.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)
    }

    func test_load_exercises_data() throws {
        // Before loading there should not be exercises.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Load exercises data
        loadExerciseData()

        // Verify that data has been loaded.
        try fetchRequestShouldReturnElements(2, for: ExerciseEntity.self)
    }
}

// MARK: - Steps

extension ExerciseEntityTests {
    private func loadExerciseData() {
        cancellable = ExerciseEntity.loadStaticData(to: context)
        sleep(1)
    }

    private func createExerciseEntity(data: Exercise) -> ExerciseEntity {
        ExerciseEntity.create(in: context, data: data)
    }

    private func verifyExerciseEntityData(_ exercise: ExerciseEntity, data: Exercise) throws {
        XCTAssertEqual(exercise.name, data.name)
        XCTAssertEqual(exercise.shortName, data.shortName)
        XCTAssertEqual(exercise.information, data.information)
        XCTAssertEqual(exercise.difficulty, data.difficulty)
        XCTAssertEqual(exercise.type, data.type)
        XCTAssertEqual(exercise.mainBodyPart, data.mainBodyPart)
        XCTAssertEqual(exercise.additionalBodyParts, data.additionalBodyParts)
        XCTAssertEqual(exercise.efforts.count, 0)
    }
}
