//
//  WorkoutEntityTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import XCTest
@testable import HeavyLog

class WorkoutEntityTests: XCTestCase {

    private var cancellable: AnyCancellable?
    private var context = PersistenceController.preview.context

    override func setUpWithError() throws {
        context.reset()
        cancellable = nil
        context = PersistenceController.preview.context
    }

    override func tearDownWithError() throws {

    }

    // MARK: - Tests
}
