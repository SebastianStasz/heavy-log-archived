//
//  WorkoutCreator.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Foundation
import Shared
import SwiftUI

enum WorkoutCreator: Int {
    case workout
    case info

    var title: String {
        return titleLocalized.text
    }

    var icon: String {
        switch self {
        case .workout:
            return SFSymbol.workoutCreatorWorkoutTab.name
        case .info:
            return SFSymbol.workoutCreatorInfoTab.name
        }
    }

    private var titleLocalized: LocalizedString {
        switch self {
        case .workout:
            return LocalizedString.workoutCreator_tab_workout
        case .info:
            return LocalizedString.workoutCreator_tab_info
        }
    }
}

// MARK: - Tab Views

extension WorkoutCreator: View {

    var body: some View {
        switch self {
        case .workout:
            Text("Wokrout")
        case .info:
            Text("Info")
        }
    }
}

// MARK: - Helpers

extension WorkoutCreator: Identifiable {
    var id: Int { rawValue }
}

extension WorkoutCreator: CaseIterable {}
