//
//  PopupVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

class PopupVM: ObservableObject {

    @Published var textFieldValue: String = ""

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

    var input: PopupModel.Input? {
        popup.input
    }

    var action: () -> Void {
        { [unowned self] in
            popup.action?()
            input?.output(textFieldValue)
            dismiss()
        }
    }

    var shouldDisplayCancelButton: Bool {
        input != nil || popup.action != nil
    }

    func dismissPopup() {
        dismiss()
    }
}
