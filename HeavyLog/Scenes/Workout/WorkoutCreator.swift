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
    case workoutTree
    case workoutInfo

    var title: String {
        return titleLocalized.text
    }

    var icon: String {
        switch self {
        case .workoutTree:
            return SFSymbol.workoutCreatorWorkoutTab.name
        case .workoutInfo:
            return SFSymbol.workoutCreatorInfoTab.name
        }
    }

    private var titleLocalized: LocalizedString {
        switch self {
        case .workoutTree:
            return LocalizedString.workoutCreator_tab_workout
        case .workoutInfo:
            return LocalizedString.workoutCreator_tab_info
        }
    }
}

// MARK: - Tab Views

extension WorkoutCreator: View {

    var body: some View {
        view.tabItem { Label(title, systemImage: icon) }
            .tag(self)
    }

    private var view: some View {
        Group {
            switch self {
            case .workoutTree:
                WorkoutTreeView()
            case .workoutInfo:
                WorkoutInfoView()
            }
        }
        .padding(vertical: .spacingHuge, horizontal: .spacingMedium)
        .embedInScrollView()
    }
}

// MARK: - Helpers

extension WorkoutCreator: Identifiable {
    var id: Int { rawValue }
}

extension WorkoutCreator: CaseIterable {}
