//
//  ExerciseEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import XCTest
@testable import HeavyLog

class ExerciseEntityTests: XCTestCase {

    private let context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Tests

    private func test_create_exercise_entity() throws {
        // Before creating there should not be exercises.
        try exerciseRequestShouldReturnElements(0)

        // Create exercise entity.
        let exercise = createExerciseEntity(data: .sampleBenchPress)

        // After creating there should be one exercise.
        try exerciseRequestShouldReturnElements(1)

        // Verify that exercise entit data is correct.
        try verifyExerciseEntityData(exercise, data: .sampleBenchPress)
    }

    private func test_edit_exercise_entity() throws {
        // Create exercise entity using bench press data.
        let exercise = createExerciseEntity(data: .sampleBenchPress)

        // Modify exercise entity using classic deadlift data.
        exercise.modify(data: .sampleClassicDeadlift)

        // Verify that data has been changed.
        try verifyExerciseEntityData(exercise, data: .sampleClassicDeadlift)
    }

    private func test_delete_exercise_entity() throws {
        // Create exercise entity.
        let exercise = createExerciseEntity(data: .sampleBenchPress)

        // Verify that exercise entity was created.
        try exerciseRequestShouldReturnElements(1)

        // Delete exercise entity
        exercise.delete()

        // Verify that exercise entity was deleted.
        try exerciseRequestShouldReturnElements(0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}

// MARK: - Steps

extension ExerciseEntityTests {

    private func createExerciseEntity(data: Exercise) -> ExerciseEntity {
        ExerciseEntity.create(in: context, data: data)
    }

    private func exerciseRequestShouldReturnElements(_ amount: Int) throws {
        let request = ExerciseEntity.createFetchRequest()
        let exercises = try! context.fetch(request)
        XCTAssertEqual(exercises.count, amount)
    }

    private func verifyExerciseEntityData(_ exercise: ExerciseEntity, data: Exercise) throws {
        XCTAssertEqual(exercise.name, data.name)
        XCTAssertEqual(exercise.shortName, data.shortName)
        XCTAssertEqual(exercise.information, data.information)
        XCTAssertEqual(exercise.difficulty, data.difficulty)
        XCTAssertEqual(exercise.type, data.type)
        XCTAssertEqual(exercise.mainBodyPart, data.mainBodyPart)
        XCTAssertEqual(exercise.additionalBodyParts, data.additionalBodyParts)
    }
}
