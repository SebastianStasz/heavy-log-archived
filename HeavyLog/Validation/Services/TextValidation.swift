//
//  TextValidation.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 08/09/2021.
//

import Foundation

struct TextValidation<T: StringProtocol>: ValidationService {

    let canBeEmpty: Bool
    let minLength: Int
    let maxLength: Int

    init(canBeEmpty: Bool = false, minLength: Int = -1, maxLength: Int = 1000) {
        self.canBeEmpty = canBeEmpty
        self.minLength = minLength
        self.maxLength = maxLength
    }

    func checkValue(_ value: String) -> ValidationResult<String> {
        if let result: ValidationResult<String> = checkIsEmpty(value) {
            return result
        }
        guard value.count >= minLength else {
            return Result(message: .tooShort)
        }
        guard value.count <= maxLength else {
            return Result(message: .tooLong)
        }
        return Result(value: value)
    }
}
