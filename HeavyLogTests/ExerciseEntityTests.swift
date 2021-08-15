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
        // Define exercise data.
        let exerciseData = Exercise.sampleBenchPress

        // Before creating there should not be exercises.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Create exercise entity using defined data.
        let exercise = try createExerciseEntity(data: exerciseData)

        // After creating there should be one exercise.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Verify that exercise entit data is correct.
        try verifyExerciseEntityData(exercise, data: exerciseData)
    }

    func test_edit_exercise_entity() throws {
        // Create exercise entity using bench press data.
        let exercise = try createExerciseEntity(data: .sampleBenchPress)

        // Modify exercise entity using classic deadlift data.
        exercise.modify(data: .sampleClassicDeadlift)

        // Verify that data has been changed.
        try verifyExerciseEntityData(exercise, data: .sampleClassicDeadlift)
    }

    func test_delete_exercise_entity() throws {
        // Define exercise data.
        let exerciseData = Exercise.sampleClassicDeadlift

        // Create exercise entity.
        let exercise = try createExerciseEntity(data: exerciseData)

        // Verify that exercise entity was created.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Create workout entity.
        let workout = createWorkoutEntity(data: .sample1)

        // Create effort entity.
        let effort = try createEffortEntity(in: workout, data: .init(exercise: exercise))

        // Verify that created effort is related with exercise.
        try verifyExerciseIsRelatedToEffort(exercise: exercise, effort: effort)

        // Delete exercise entity.
        exercise.delete()

        // Verify that exercise entity was deleted.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Verify effort properties after deleting an exercise.
        try verifyEffortPropertiesAfterExerciseDeleted(effort: effort, data: exerciseData)
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

    private func verifyExerciseIsRelatedToEffort(exercise: ExerciseEntity, effort: EffortEntity) throws {
        XCTAssertEqual(effort.exercise, exercise)
        XCTAssertEqual(effort.exerciseId, exercise.id_)
    }

    private func verifyEffortPropertiesAfterExerciseDeleted(effort: EffortEntity, data: Exercise) throws {
        // Related exercise should be nil.
        XCTAssertEqual(effort.exercise, nil)
        // Related exercise id should contain previous exercise id.
        XCTAssertEqual(effort.exerciseId, data.id)
    }
}
