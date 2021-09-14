//
//  ValueValidationTests.swift
//  HeavyLogTests
//
//  Created by Sebastian Staszczyk on 14/09/2021.
//

import XCTest
@testable import HeavyLog

class ValueValidationTests: XCTestCase {

    private var validation: ValueValidation!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    // MARK: - Tests

    func test_empty_input() throws {
        // Define value validation of integer type.
        validation = ValueValidation(type: .integer)

        // Get validation result for empty string.
        let result = validation.checkValue("")

        // Returned value should be nil, and validation message shoud be "empty".
        try result.checkValidation(expectedResult: nil, expectedValidation: .empty)
    }

    func test_integer_validation() throws {
        // Define value validation of integer type.
        validation = ValueValidation(type: .integer)

        // Define invalid values.
        let invalidValues = [".9", ".", "1.1", "1,1", "0.0", "abc", ",", ",,"]

        // Returned result value should be nil, and validation message shoud be "invalid".
        try checkInvalidValues(invalidValues, expectedValidation: .invalid)

        // Define valid values.
        let validValues = ["1", "123", "0001"]

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(validValues)
    }

    func test_double_validation() throws {
        // Define value validation of double type.
        validation = ValueValidation(type: .double)

        // Define invalid values.
        let invalidValues = ["abc", "1..", "1,,", "1.1.", "1,1,", ".", ","]

        // Returned result value should be nil, and validation message shoud be "invalid".
        try checkInvalidValues(invalidValues, expectedValidation: .invalid)

        // Define valid values.
        let validValues = [".9", "1.", ",9", "1,", "1.1", "1,1"]

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(validValues)
    }

    func test_minValue() throws {
        // Define value validation of integer type and minValue equal 100.
        validation = ValueValidation(type: .integer, minValue: 100)

        // Returned result value should be nil, and validation message shoud be "tooSmall".
        try checkInvalidValues(["0", "99"], expectedValidation: .tooSmall)

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(["100", "101"])
    }

    func test_maxValue() throws {
        // Define value validation of integer type and maxValue equal 100.
        validation = ValueValidation(type: .integer, maxValue: 100)

        // Returned result value should be nil, and validation message shoud be "tooBig".
        try checkInvalidValues(["101", "1000"], expectedValidation: .tooBig)

        // Returned result value should be equal entered value, and validation message shoud be nil.
        try checkValidValues(["100", "99"])
    }
}

// MARK: - Steps

extension ValidationResult {
    fileprivate func checkValidation(expectedResult: String?, expectedValidation: ValidationMessage?) throws {
        XCTAssertEqual(self.value, expectedResult)
        XCTAssertEqual(self.message, expectedValidation?.message)
    }
}

extension ValueValidationTests {
    private func checkInvalidValues(_ values: [String], expectedValidation: ValidationMessage) throws {
        for value in values {
            let result = validation.checkValue(value)
            try result.checkValidation(expectedResult: nil, expectedValidation: expectedValidation)
        }
    }

    private func checkValidValues(_ values: [String]) throws {
        for value in values {
            var value = value
            value = value.replacingOccurrences(of: ",", with: ".")
            let result = validation.checkValue(value)
            try result.checkValidation(expectedResult: String(Double(value)!), expectedValidation: nil)
        }
    }
}
