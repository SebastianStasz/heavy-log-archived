//
//  PopupVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

class PopupVM: ObservableObject {

    private let popup: PopupModel
    private let dismiss: () -> Void

    init(_ type: PopupModel, dismiss: @escaping () -> Void) {
        self.popup = type
        self.dismiss = dismiss
    }

    var title: String {
        popup.title
    }

    var message: String? {
        popup.message
    }

    var shouldDisplayCancelButton: Bool {
        popup.isCancelButton
    }

    var textFieldVM: TextFieldType? {
        guard let vm = popup.textFieldVM else { return nil }
        return vm
    }

    var picker: PopupModel.Picker? {
        guard let vm = popup.picker else { return nil }
        return vm
    }

    func dismissPopup() {
        dismiss()
    }

    func action() {
        confirmAction?()
        textFieldOutput?(textFieldVM!.textField)
        textFieldAndPickerOutput?(textFieldVM!.textField, picker!.viewModel.selectedValue)
        dismiss()
    }

    private var confirmAction: (() -> Void)? {
        guard case let .action(_, action) = popup else { return nil }
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
