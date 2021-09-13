//
//  TextFieldVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import Combine
import UIKit
import SwiftUI

enum TextFieldType {
    case integer(viewModel: TextFieldVM<Int, ValueValidation<Int>>)

    var textField: String {
        switch self {
        case let .integer(viewModel):
            return viewModel.textField
        }
    }

    var intViewModel: TextFieldVM<Int, ValueValidation<Int>>? {
        switch self {
        case let .integer(viewModel):
            return viewModel
        }
    }
}

final class TextFieldVM<T: Comparable, Validation: ValidationService>: ObservableObject where T == Validation.T {

    private var cancellable: AnyCancellable?
    private let validation: Validation
    private let dropFirst: Int

    @Binding var result: T?
    @Published var textField: String
    @Published var validationMessage: String?
    let placeholder: String
    let type: UIKeyboardType

    init(result: Binding<T?>, validation: Validation, initialValue: String = "", placeholder: String = "", type: UIKeyboardType = .default, dropFirst: Int = 1) {
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
            .map { value -> ValidationResult<T> in
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

    static func integer(value: Binding<Int>, placeholder: String = "100") -> TextFieldVM where T == Int {
        TextFieldVM(result: .constant(0), validation: ValueValidation<Int>(type: .integer) as! Validation, placeholder: placeholder, type: .decimalPad)
    }
}
