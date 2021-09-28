//
//  RatePickerSupport.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import HeavyLogCoreData
import SwiftUI

protocol RatePickerSupport where Self: RawRepresentable, Self: Pickerable {
    static var possibleCases: [Self] { get }

    var name: String { get }
    var color: Color { get }
}

// MARK: - Workout Rate

extension WorkoutRate: RatePickerSupport {

    static var possibleCases: [WorkoutRate] {
        WorkoutRate.allCases.dropLast()
    }

    var color: Color {
        switch self {
        case .bad:
            return .accentRed
        case .good:
            return .accentOrange
        case .excelent:
            return .accentGreen
        case .unknown:
            return .black
        }
    }
}
