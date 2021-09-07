//
//  TextFieldVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import UIKit

final class TextFieldVM: ObservableObject {

    @Published var value: String
    let placeholder: String
    let type: UIKeyboardType

    init(initialValue: String = "", placeholder: String = "", type: UIKeyboardType = .default) {
        self.value = initialValue
        self.placeholder = placeholder
        self.type = type
    }
}

extension TextFieldVM {
    static func integer(placeholder: String = "100") -> TextFieldVM {
        .init(placeholder: placeholder, type: .decimalPad)
    }
}
