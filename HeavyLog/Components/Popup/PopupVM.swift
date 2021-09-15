//
//  PopupVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

final class PopupVM: ObservableObject {

    private let popup: PopupModel
    private let dismiss: () -> Void

    init(_ type: PopupModel, dismiss: @escaping () -> Void) {
        self.popup = type
        self.dismiss = dismiss
    }

    func dismissPopup() {
        dismiss()
    }

    func action() {
        guard isValid else { return }
        confirmAction?()
        textFieldOutput?(textFieldVM!.textField)
        textFieldAndPickerOutput?(textFieldVM!.textField, picker!.viewModel.selectedValue)
        dismiss()
    }

    var title: String { popup.title }
    var message: String? { popup.message }
    var shouldDisplayCancelButton: Bool { popup.isCancelButton }
    var isDestructive: Bool { popup.isDestructive }

    var textFieldVM: TextFieldVM? {
        guard let vm = popup.textFieldVM else { return nil }
        return vm
    }

    var picker: PopupModel.Picker? {
        guard let vm = popup.picker else { return nil }
        return vm
    }

    private var isValid: Bool {
        textFieldVM?.forceValidation()
        return textFieldVM?.isValid ?? true
    }

    private var confirmAction: (() -> Void)? {
        guard case let .action(_, action, _) = popup else { return nil }
        return action
    }

    private var textFieldOutput: ((String) -> ())? {
        guard case let .textField(_, _, output) = popup else { return nil }
        return output
    }

    private var textFieldAndPickerOutput: ((String, Int) -> Void)? {
        guard case let .textFieldAndPicker(_, _, _, output) = popup else { return nil }
        return output
    }
}
