//
//  ExerciseFilterForm.swift
//  ExerciseFilterForm
//
//  Created by Sebastian Staszczyk on 28/09/2021.
//

import HeavyLogCoreData
import Foundation

struct ExerciseFilterForm {
    var difficulty: Difficulty = .unknown
    var section: ExerciseSection = .unknown
    var type: ExerciseType = .unknown

    var filters: [Filter] {
        [Filter.byDifficulty(difficulty),
         Filter.bySection(section),
         Filter.byType(type)]
    }

    var activeFilters: Int {
        (difficulty == .unknown ? 0 : 1) +
        (section == .unknown ? 0 : 1) +
        (type == .unknown ? 0 : 1)
    }

    mutating func resetToDefault() {
        difficulty = .unknown
        section = .unknown
        type = .unknown
    }

    typealias Filter = ExerciseEntity.Filter
}
