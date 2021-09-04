//
//  PopupVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Foundation

struct PopupVM {

    private let type: PopupModel
    private let dismiss: () -> Void

    init(_ type: PopupModel, dismiss: @escaping () -> Void) {
        self.type = type
        self.dismiss = dismiss
    }

    var title: String {
        type.title
    }

    var message: String? {
        type.message
    }

    var action: () -> Void {
        { type.action?() ; dismiss() }
    }

    var shouldDisplayCancelButton: Bool {
        type.action != nil
    }

    func dismissPopup() {
        dismiss()
    }
}
