//
//  TabBarModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Shared
import SwiftUI

enum TabBarModel: Int {
    case dashboard
    case workouts
    case summary
    case exercises

    var title: String {
        switch self {
        case .dashboard:
            return LocalizedString.tab_dashboard_title.key
        case .workouts:
            return LocalizedString.tab_workouts_title.key
        case .summary:
            return LocalizedString.tab_summary_title.key
        case .exercises:
            return LocalizedString.tab_settings_title.key
        }
    }

    var icon: String {
        switch self {
        case .dashboard:
            return "house"
        case .workouts:
            return "speedometer"
        case .summary:
            return "calendar"
        case .exercises:
            return "gearshape"
        }
    }

    var navigationTitle: String? {
        switch self {
        case .dashboard:
            return nil
        default:
            return title
        }
    }
}

// MARK: - Tab Views

extension TabBarModel: View {

    var body: some View {
        switch self {
        case .dashboard:
            DashboardView()
        case .workouts:
            Text(self.title.localize())
        case .summary:
            SummaryView()
        case .exercises:
            ExerciseListView(paddingTop: .spacingSmall)
        }
    }
}

// MARK: - Helpers

extension TabBarModel: CaseIterable {
    static var count: Int { allCases.count }
}

extension TabBarModel: Identifiable {
    var id: Int { rawValue }
}
