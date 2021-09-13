//
//  ValueValidation.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 13/09/2021.
//

import Foundation

struct ValueValidation<T: Comparable>: ValidationService {

    let type: NumberType
    let canBeEmpty: Bool
    let minValue: T?
    let maxValue: T?

    init(type: NumberType, canBeEmpty: Bool = false, minValue: T? = nil, maxValue: T? = nil) {
        self.type = type
        self.canBeEmpty = canBeEmpty
        self.minValue = minValue
        self.maxValue = maxValue
    }

    func checkValue(_ value: String) -> ValidationResult<T> {
        if let result: ValidationResult<T> = checkIsEmpty(value) {
            return result
        }
        guard let value: T = type.checkIsValid(value) else {
            return Result(message: .invalid)
        }
        if let minValue = minValue, value < minValue {
            return Result(message: .toSmall)
        }
        if let maxValue = maxValue, value > maxValue {
            return Result(message: .tooBig)
        }
        return Result(value: value)
    }
}
