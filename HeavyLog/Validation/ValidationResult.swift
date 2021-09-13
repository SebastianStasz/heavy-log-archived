//
//  ValidationResult.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/09/2021.
//

import Foundation

struct ValidationResult<T> {
    let value: T?
    private let validationMessage: ValidationMessage?

    var message: String? {
        validationMessage?.message
    }

    init(value: T) {
        self.value = value
        self.validationMessage = nil
    }

    init(message: ValidationMessage) {
        self.value = nil
        self.validationMessage = message
    }
}
