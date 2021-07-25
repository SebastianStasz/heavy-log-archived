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

    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .workouts:
            return "Workouts"
        case .summary:
            return "Summary"
        case .settings:
            return "Settings"
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
}

// MARK: - Tab Views

extension TabBarModel: View {

    var body: some View {
        switch self {
        case .dashboard:
            Text(self.title).tag(self)
        case .workouts:
            Text(self.title).tag(self)
        case .summary:
            SummaryView().tag(self)
        case .settings:
            Text(self.title).tag(self)
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
