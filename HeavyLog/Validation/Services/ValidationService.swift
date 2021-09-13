//
//  ValidationService.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 13/09/2021.
//

import Foundation

protocol ValidationService {
    associatedtype T

    typealias Result = ValidationResult

    var canBeEmpty: Bool { get }
    func checkValue(_ value: String) -> ValidationResult<T>
}

extension ValidationService {
    func checkIsEmpty<T>(_ value: String) -> ValidationResult<T>? {
        guard !canBeEmpty && value.count != 0 else {
            return ValidationResult(message: .empty)
        }
        return nil
    }

    func checkIsValid<T>(_ value: String) -> T? {
        guard let value = value as? T else {
            return nil
        }
        return value
    }
}
