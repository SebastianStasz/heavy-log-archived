//
//  CoreDataSteps.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import CoreData
import XCTest
@testable import HeavyLog

protocol CoreDataSteps {
    var context: NSManagedObjectContext { get set }

    func createWorkoutEntity(data: Workout) -> WorkoutEntity
}

extension CoreDataSteps {

    func createWorkoutEntity(data: Workout) -> WorkoutEntity {
        WorkoutEntity.create(in: context, data: data)
    }

    @discardableResult
    func createEffortEntity(in workout: WorkoutEntity, data: Effort) throws -> EffortEntity {
        try XCTUnwrap(EffortEntity.create(in: workout, data: data))
    }

    func fetchRequestShouldReturnElements<T: NSManagedObject>(_ amount: Int, for entity: T.Type) throws {
        let request: NSFetchRequest<T> = T.createFetchRequest()
        let entities = try! context.fetch(request)
        XCTAssertEqual(entities.count, amount)
    }
}
