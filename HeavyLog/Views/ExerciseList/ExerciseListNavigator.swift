//
//  ExerciseListNavigator.swift
//  ExerciseListNavigator
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseListNavigator {
    enum Destination {
        case exerciseList
        case exerciseFilterSheet
    }

    var sheet: Sheet?
    var selectedTab: Tab = .builtIn

    enum Sheet: View, Identifiable {
        case exerciseFilter(ExerciseFilterVM)

        var body: some View {
            switch self {
            case let .exerciseFilter(viewModel):
                ExerciseFilterView(viewModel: viewModel)
            }
        }

        var id: Int {
            switch self {
            case .exerciseFilter:
                return 0
            }
        }
    }
}

// MARK: - Tab

extension ExerciseListNavigator {
    enum Tab: Int, Identifiable, CaseIterable {
        case builtIn
        case own

        var title: String {
            switch self {
            case .builtIn:
                return .common_builtin
            case .own:
                return .common_own
            }
        }

        var filter: Kind {
            switch self {
            case .builtIn:
                return Kind.builtIn
            case .own:
                return Kind.addedByUser
            }
        }

        var id: Int { rawValue }
    }

    typealias Kind = ExerciseEntity.Filter.Kind
}
