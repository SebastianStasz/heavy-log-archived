//
//  ActivityControllerNavigator.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation

final class ActivityControllerNavigator {
    enum Destination {
        case someErrorOccurred
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .someErrorOccurred:
            presentSomeErrorPopup()
        }
    }

    private func presentSomeErrorPopup() {
        let popup = PopupModel.info(.init(title: "Error", message: "Some error occureed. Please try again later."))
        controller.present(popup: popup)
    }
}
