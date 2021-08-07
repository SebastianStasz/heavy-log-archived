//
//  TabBarModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

enum TabBarModel: Int {
    case dashboard
    case workouts
    case summary
    case settings

    var title: LocalizedStringKey {
        switch self {
        case .dashboard:
            return LocalizedString.tab_dashboard_title.key
        case .workouts:
            return LocalizedString.tab_workouts_title.key
        case .summary:
            return LocalizedString.tab_summary_title.key
        case .settings:
            return LocalizedString.tab_settings_title.key
        }
    }

    var image: String {
        switch self {
        case .dashboard:
            return "house"
        case .workouts:
            return "speedometer"
        case .summary:
            return "calendar"
        case .settings:
            return "gearshape"
        }
    }

    var navigationTitle: LocalizedStringKey? {
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
            Text(self.title)
        case .workouts:
            Text(self.title)
        case .summary:
            SummaryView()
        case .settings:
            Text(self.title)
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
