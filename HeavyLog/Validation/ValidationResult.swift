//
//  ValidationResult.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/09/2021.
//

import Foundation

struct ValidationResult {
    let value: String?
    private let validationMessage: ValidationMessage?

    var message: String? {
        validationMessage?.message
    }

    init(value: String) {
        self.value = value
        self.validationMessage = nil
    }

    init(message: ValidationMessage) {
        self.value = nil
        self.validationMessage = message
    }
}

extension ValidationResult: Equatable {}
