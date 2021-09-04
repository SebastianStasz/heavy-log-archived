//
//  PopupModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import UIKit

struct PopupModel {
    let title: String
    let message: String?
    let action: (() -> Void)?
    let input: Input?

    init(title: String, message: String, action: (() -> Void)? = nil, input: Input? = nil) {
        self.title = title
        self.message = message
        self.action = action
        self.input = input
    }
}

// MARK: - Pop-Up Model Input

extension PopupModel {

    struct Input {
        let placeholder: String
        let type: UIKeyboardType
        let output: (String) -> Void

        init(placeholder: String, type: UIKeyboardType = .default, output: @escaping (String) -> Void) {
            self.placeholder = placeholder
            self.type = type
            self.output = output
        }
    }
}


// MARK: - Sample Data

extension PopupModel {
    static let sampleInfo = PopupModel(title: "Info", message: "Lorem ipsum dolor sit amet, consect a dipiscing elit. Ut vel neque lont.")
    static let sampleAction = PopupModel(title: "Action", message: "Are you sure you want to print something in the console?", action: { print("Something") })
    static let sampleIntpu = PopupModel(title: "Input", message: "Enter some value:", action: nil, input: .init(placeholder: "Placeholder", output: { print($0) }))
}
