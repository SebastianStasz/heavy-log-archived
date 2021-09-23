//
//  SettingsVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation
import HeavyLogCoreData

final class SettingsVM: ObservableObject {

    let navigator = SettingsNavigator()

    func exportWorkoutData() {
        guard let workoutsData = WorkoutEntity.getAllWorkoutsCodableData(from: controller.context) else {
            navigator.navigate(to: .failedToFetchDataPopup) ; return
        }
        guard workoutsData.isNotEmpty else {
            navigator.navigate(to: .noWorkoutDataPopup) ; return
        }
    }

    private func saveWorkoutsData(_ data: [WorkoutData.Coding]) {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        do {
            let jsonData = try encoder.encode(data)

            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print(jsonString)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}
