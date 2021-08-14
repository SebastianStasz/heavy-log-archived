//
//  WorkoutRate.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import Foundation

enum WorkoutRate: String {
    case bad
    case good
    case excelent
    case unknown

    var name: String {
        nameLocalized.key
    }

    private var nameLocalized: LocalizedString {
        switch self {
        case .bad:
            return LocalizedString.common_workoutRate_bad
        case .good:
            return LocalizedString.common_workoutRate_good
        case .excelent:
            return LocalizedString.common_workoutRate_excelent
        case .unknown:
            return LocalizedString.error_enum_unknown
        }
    }
}

extension WorkoutRate: UnknownValueSupport {
    static let unknownCase: WorkoutRate = .unknown
}
