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

    // MARK: - Tests

    func test_create_exercise_entity() throws {
        // Define exercise data.
        let exerciseData = Exercise.sampleBenchPress

        // Before creating there should not be exercises.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Create exercise entity using defined data.
        let exerciseEntity = try createExerciseEntity(exerciseData: exerciseData)

        // After creating there should be one exercise.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Verify that exercise entity data is correct.
        try verifyExerciseEntityData(exerciseEntity, data: exerciseData)
    }

    func test_edit_exercise_entity() throws {
        // Define initial exercise data.
        let exerciseData = Exercise.sampleBenchPress

        // Create exercise entity using defined data.
        let exerciseEntity = try createExerciseEntity(exerciseData: exerciseData)

        // Modify exercise entity using classic deadlift data.
        exerciseEntity.modify(exerciseData: .sampleClassicDeadlift)

        // Verify that data has been changed, but id is the same.
        try verifyExerciseEntityData(exerciseEntity, data: .sampleClassicDeadlift, id: exerciseData.id)
    }

    func test_delete_exercise_entity() throws {
        // Define exercise data.
        let exerciseData = Exercise.sampleClassicDeadlift

        // Create exercise entity.
        let exerciseEntity = try createExerciseEntity(exerciseData: exerciseData)

        // Verify that exercise entity was created.
        try fetchRequestShouldReturnElements(1, for: ExerciseEntity.self)

        // Create effort entity.
        let effortEntity = try createEffortEntity(workoutData: .sample1, exerciseEntity: exerciseEntity, setsData: [])

        // Verify that created effort is related with exercise.
        try verifyExerciseIsRelatedToEffort(exercise: exerciseEntity, effort: effortEntity)

        // Delete exercise entity.
        exerciseEntity.delete()

        // Verify that exercise entity was deleted.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Verify effort properties after deleting an exercise.
        try verifyEffortPropertiesAfterExerciseDeleted(effort: effortEntity, data: exerciseData)
    }

    func test_load_exercises_data() throws {
        // Before loading there should not be exercises.
        try fetchRequestShouldReturnElements(0, for: ExerciseEntity.self)

        // Load exercise data.
        loadExerciseData()

        // After loading there should be two exercises.
        try fetchRequestShouldReturnElements(2, for: ExerciseEntity.self)
    }
}

// MARK: - Steps

extension ExerciseEntityTests {

    private func loadExerciseData() {
        cancellable = ExerciseEntity.loadStaticData(to: context)
        sleep(1)
    }

    private func verifyExerciseEntityData(_ exercise: ExerciseEntity, data: Exercise, id: Int? = nil) throws {
        XCTAssertEqual(exercise.type, data.type)
        XCTAssertEqual(exercise.name, data.name)
        XCTAssertEqual(exercise.shortName, data.shortName)
        XCTAssertEqual(exercise.difficulty, data.difficulty)
        XCTAssertEqual(exercise.information, data.information)
        XCTAssertEqual(exercise.mainBodyPart, data.mainBodyPart)
        XCTAssertEqual(exercise.additionalBodyParts, data.additionalBodyParts)
        XCTAssertEqual(exercise.numberOfEfforts, 0)
        XCTAssertEqual(exercise.isEditable, true)
        XCTAssertEqual(exercise.id_, id ?? data.id)
    }

    private func verifyExerciseIsRelatedToEffort(exercise: ExerciseEntity, effort: EffortEntity) throws {
        XCTAssert(exercise.efforts.contains(effort))
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
