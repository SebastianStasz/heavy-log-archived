//
//  SettingsVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/09/2021.
//

import Foundation
import HeavyLogCoreData

final class SettingsVM: ObservableObject {

    private lazy var activityController = ActivityController()
    let navigator = SettingsNavigator()

    func exportWorkoutData() {
        guard let workoutsData = WorkoutEntity.getAllWorkoutsCodableData(from: controller.context) else {
            navigator.navigate(to: .failedToFetchDataPopup) ; return
        }
        guard workoutsData.isNotEmpty else {
            navigator.navigate(to: .noWorkoutDataPopup) ; return
        }
        let date = Date().string(format: .medium)
        let fileName = "HeavyLog - Workout data \(date)"
        activityController.writeData(workoutsData, withName: fileName, withExtension: "json")
    }
}
