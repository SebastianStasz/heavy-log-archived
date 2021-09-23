//
//  SettingsNavigator.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation

final class SettingsNavigator {
    enum Destination {
        case failedToFetchDataPopup
        case noWorkoutDataPopup
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .failedToFetchDataPopup:
            presentFailedToFetchWorkoutData()
        case .noWorkoutDataPopup:
            presentNoWorkoutDataPopup()
        }
    }
}

extension SettingsNavigator {

    private func presentFailedToFetchWorkoutData() {
        let popup = PopupModel.info(.init(title: "Exporting workout data", message: "Failed to fetch workout data. Try again later."))
        controller.present(popup: popup)
    }

    private func presentNoWorkoutDataPopup() {
        let popup = PopupModel.info(.init(title: "Exporting workout data", message: "There is no workout data to export."))
        controller.present(popup: popup)
    }
}
