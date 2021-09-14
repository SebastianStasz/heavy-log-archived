//
//  TextFieldVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import Combine
import SwiftUI

final class TextFieldVM: ObservableObject {

    private var cancellable: AnyCancellable?
    private let validation: ValidationService
    private let dropFirst: Int

    @Binding var result: String?
    @Published var textField: String
    @Published var validationMessage: String?
    let placeholder: String
    let type: UIKeyboardType

    init(result: Binding<String?>, validation: ValidationService, initialValue: String = "", placeholder: String = "", type: UIKeyboardType = .default, dropFirst: Int = 1) {
        self._result = result
        self.validation = validation
        self.textField = initialValue
        self.placeholder = placeholder
        self.type = type
        self.dropFirst = dropFirst

        cancellable = $textField
            .removeDuplicates()
            .dropFirst(dropFirst)
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .map { value -> ValidationResult in
                validation.checkValue(value)
            }
            .sink { [weak self] validation in
                self?.validationMessage = validation.message
                self?.result = validation.value
            }
    }
}

// MARK: - Models

extension TextFieldVM {

    static func text(result: Binding<String?>, placeholder: String = "") -> TextFieldVM {
        TextFieldVM(result: result, validation: TextValidation(), placeholder: placeholder)
    }

    static func integer(result: Binding<String?>, placeholder: String = "100") -> TextFieldVM {
        TextFieldVM(result: result, validation: ValueValidation(type: .integer), placeholder: placeholder, type: .decimalPad)
    }

    static func double(result: Binding<String?>, placeholder: String = "100.00") -> TextFieldVM {
        TextFieldVM(result: result, validation: ValueValidation(type: .double), placeholder: placeholder, type: .decimalPad)
    }
}
