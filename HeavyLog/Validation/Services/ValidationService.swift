//
//  ValidationService.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 13/09/2021.
//

import Foundation

protocol ValidationService {
    typealias Result = ValidationResult

    var canBeEmpty: Bool { get }
    func checkValue(_ value: String) -> ValidationResult
}

extension ValidationService {
    func checkIsEmpty(_ value: String) -> ValidationResult? {
        guard !canBeEmpty && value.count != 0 else {
            return ValidationResult(message: .empty)
        }
        return nil
    }
}
