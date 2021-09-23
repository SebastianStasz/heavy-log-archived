//
//  ValueValidation.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 13/09/2021.
//

import Foundation

struct ValueValidation: ValidationService {

    let type: NumberType
    let canBeEmpty = false
    let minValue: Double?
    let maxValue: Double?

    init(type: NumberType, minValue: Double? = nil, maxValue: Double? = nil) {
        self.type = type
        self.minValue = minValue
        self.maxValue = maxValue
    }

    func checkValue(_ value: String) -> ValidationResult {
        if let result: ValidationResult = checkIsEmpty(value) {
            return result
        }
        guard let value = type.checkIsValid(value) else {
            return Result(message: .invalid)
        }
        if let minValue = minValue, value < minValue {
            return Result(message: .tooSmall)
        }
        if let maxValue = maxValue, value > maxValue {
            return Result(message: .tooBig)
        }
        return Result(value: String(value))
    }
}
