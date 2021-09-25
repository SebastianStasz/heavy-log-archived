//
//  NSManagedObjectTests.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import CoreData
import XCTest
@testable import HeavyLogCoreData

class NSManagedObjectTests: XCTestCase, CoreDataSteps {

    var context = PersistenceController.previewEmpty.context

    override func setUpWithError() throws {
        context.reset()
        context = PersistenceController.previewEmpty.context
    }

//    func test_managedObject_not_including() throws {
//        // Create exercise entity using classic deadlift data.
//        try createExerciseEntity(exerciseData: .sampleClassicDeadlift)
//
//        // Create exercise entity using bench press data.
//        try createExerciseEntity(exerciseData: .sampleBenchPress)
//
//        // Create exercise entity using overhand pull-up data.
//        let overhandPullup = try createExerciseEntity(exerciseData: .samplePullupsOverhand)
//
//        // Create request without specifying exercise entities.
//        let request1: NSFetchRequest<ExerciseEntity> = ExerciseEntity.nsFetchRequest(predicate: ExerciseEntity.allExcept([]))
//
//        // Request1 should return 3 exercise entities.
//        try customFetchRequestShouldReturnElements(request: request1, amount: 3, for: ExerciseEntity.self)
//
//        // Create request not including overhand pull-up exercise.
//        let request2: NSFetchRequest<ExerciseEntity> = ExerciseEntity.nsFetchRequest(predicate: ExerciseEntity.allExcept([overhandPullup]))
//
//        // Request2 should return 2 exercise entities.
//        let result2 = try customFetchRequestShouldReturnElements(request: request2, amount: 2, for: ExerciseEntity.self)
//
//        // Result of request2 should not contain overhandPullup exercise entity.
//        XCTAssertFalse(result2.contains(overhandPullup))
//    }
}
