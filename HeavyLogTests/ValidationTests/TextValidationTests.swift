//
//  TextValidationTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/09/2021.
//

import XCTest
@testable import HeavyLog

class TextValidationTests: XCTestCase {

    private var validation: TextValidation!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    // MARK: - Tests

    func test_canBeEmpty() throws {
        // Define text validation that accept empty text.
        validation = TextValidation(canBeEmpty: true)

        // Get validation result for empty string.
        let result = validation.checkValue("")

        // Returned value should be "", and validation message shoud be nil.
        try result.checkValidation(expectedResult: "", expectedValidation: nil)
    }

    func test_not_canBeEmpty() throws {
        // Define text validation that doesn't accept empty text.
        validation = TextValidation(canBeEmpty: false)

        // Get validation result for empty string.
        let result = validation.checkValue("")

        // Returned value should be nil, and validation message shoud be "empty".
        try result.checkValidation(expectedResult: nil, expectedValidation: .empty)
    }

    func test_tooShort() throws {
        // Define text validation that should have at least 4 characters.
        validation = TextValidation(minLength: 4)

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(["abcd", "abcde"])

        // Returned result value should be nil, and validation message shoud be "tooShort".
        try checkInvalidValues(["a", "abc"], expectedValidation: .tooShort)
    }

    func test_tooLong() throws {
        // Define text validation that should have at least 4 characters.
        validation = TextValidation(maxLength: 4)

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(["a", "abcd"])

        // Returned result value should be nil, and validation message shoud be "tooLong".
        try checkInvalidValues(["abcde", "asdasdasd"], expectedValidation: .tooLong)
    }
}

// MARK: - Steps

extension ValidationResult {
    fileprivate func checkValidation(expectedResult: String?, expectedValidation: ValidationMessage?) throws {
        XCTAssertEqual(self.value, expectedResult)
        XCTAssertEqual(self.message, expectedValidation?.message)
    }
}

extension TextValidationTests {
    private func checkInvalidValues(_ values: [String], expectedValidation: ValidationMessage) throws {
        for value in values {
            let result = validation.checkValue(value)
            try result.checkValidation(expectedResult: nil, expectedValidation: expectedValidation)
        }
    }

    private func checkValidValues(_ values: [String]) throws {
        for value in values {
            let result = validation.checkValue(value)
            try result.checkValidation(expectedResult: value, expectedValidation: nil)
        }
    }
}
