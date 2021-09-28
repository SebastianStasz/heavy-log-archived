//
//  ExerciseFilterVM.swift
//  ExerciseFilterVM
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import HeavyLogCoreData
import Foundation
import SwiftUI

struct ExerciseFilterVM: Equatable {
    var searchText = ""
    var selectedTab: Tab = .builtIn
    var difficulty: Difficulty = .unknown
    var section: ExerciseSection = .unknown
    var type: ExerciseType = .unknown

    var filters: [Filter] {
        [Filter.byName(searchText),
         Filter.byKind(selectedTab.filter),
         Filter.byDifficulty(difficulty),
         Filter.bySection(section),
         Filter.byType(type)]
    }

    mutating func resetToDefault() {
        difficulty = .unknown
        section = .unknown
        type = .unknown
    }
}

// MARK: - Tabs

extension ExerciseFilterVM {
    typealias Filter = ExerciseEntity.Filter

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

        var filter: Filter.Kind {
            switch self {
            case .builtIn:
                return Filter.Kind.builtIn
            case .own:
                return Filter.Kind.addedByUser
            }
        }

        var id: Int { rawValue }
    }
}
