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

    mutating func resetToDefault() {
        difficulty = .unknown
        section = .unknown
        type = .unknown
    }

    typealias Filter = ExerciseEntity.Filter
}
