//
//  PopupModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Foundation

enum PopupModel {
    case info(Info)
    case action(Info, action: () -> Void)
    case textField(Info, TextFieldType, output: (String) -> Void)
    case textFieldAndPicker(Info, TextFieldType, Picker, output: (String, Int) -> Void)

    struct Info {
        let title: String
        let message: String
    }

    struct Picker {
        let hint: String
        let viewModel: IntegerPickerVM
    }

    var title: String {
        switch self {
        case let .info(info),
             let .action(info, _),
             let .textField(info, _, _),
             let .textFieldAndPicker(info, _, _, _):
            return info.title
        }
    }

    var message: String {
        switch self {
        case let .info(info),
             let .action(info, _),
             let .textField(info, _, _),
             let .textFieldAndPicker(info, _, _, _):
            return info.message
        }
    }

    var isCancelButton: Bool {
        switch self {
        case .info:
            return false
        default:
            return true
        }
    }

    var textFieldVM: TextFieldType? {
        switch self {
        case let .textField(_, vm, _):
            return vm
        case let .textFieldAndPicker(_, vm, _, _):
            return vm
        default:
            return nil
        }
    }

    var picker: Picker? {
        switch self {
        case let .textFieldAndPicker(_, _, picker, _):
            return picker
        default:
            return nil
        }
    }
}

extension PopupModel {

    static func addSet(to exercise: String, action: @escaping (String, Int) -> Void) -> PopupModel {
        let info = Info(title: exercise, message: "Enter weight:")
        return PopupModel.textFieldAndPicker(info, .integer(viewModel: .init(result: .constant(2), validation: ValueValidation(type: .double))), .init(hint: "Number of reps:", viewModel: .repsPicker), output: action)
    }
}

// MARK: - Sample Data

extension PopupModel {
    static let sampleInfo = PopupModel.info(.init(title: "Info", message: "Sample message here."))
    static let sampleAction = PopupModel.action(.init(title: "Action", message: "Press OK if you want to print something."), action: { print("Something") })
    static let sampleTextField = PopupModel.textField(.init(title: "Text Field", message: "Enter some value and press OK to print it."), .integer(viewModel: .integer(value: .constant(2))), output: { print($0) })
    static let sampleTextFieldAndPicker = PopupModel.addSet(to: "Bench Press", action: { print("Weight: \($0), Reps: \($1)") })
}
