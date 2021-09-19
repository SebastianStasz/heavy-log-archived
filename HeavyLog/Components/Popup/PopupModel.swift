//
//  PopupModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Foundation

enum PopupModel {
    case info(Info)
    case action(Info, action: () -> Void, isDestructive: Bool = false)
    case textField(Info, TextFieldVM, output: (String) -> Void)
    case textFieldAndPicker(Info, TextFieldVM, Picker, output: (String, Int) -> Void)

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
             let .action(info, _, _),
             let .textField(info, _, _),
             let .textFieldAndPicker(info, _, _, _):
            return info.title
        }
    }

    var message: String {
        switch self {
        case let .info(info),
             let .action(info, _, _),
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

    var isDestructive: Bool {
        switch self {
        case let .action(_, action: _, isDestructive):
            return isDestructive
        default:
            return false
        }
    }

    var textFieldVM: TextFieldVM? {
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

// MARK: - Models

extension PopupModel {

    static func addSet(to exercise: String, action: @escaping (String, Int) -> Void) -> PopupModel {
        let info = Info(title: exercise, message: .workoutCreator_enterWeight)
        let textFieldVM = TextFieldVM.double(result: .constant(""))
        let pickerModel = PopupModel.Picker(hint: .workoutCreator_numberOfReps, viewModel: .repsPicker)
        return PopupModel.textFieldAndPicker(info, textFieldVM, pickerModel, output: action)
    }
}


// MARK: - Sample Data

extension PopupModel {
    static let sampleInfo = PopupModel.info(.init(title: "Info", message: "Sample message here."))
    static let sampleAction = PopupModel.action(.init(title: "Action", message: "Press OK if you want to print something."), action: { print("Something") })
    static let sampleTextField = PopupModel.textField(.init(title: "Text Field", message: "Enter some value and press OK to print it."), .init(result: .constant("2"), validation: ValueValidation(type: .double)), output: { print($0) })
    static let sampleTextFieldAndPicker = PopupModel.addSet(to: "Bench Press", action: { print("Weight: \($0), Reps: \($1)") })
}
