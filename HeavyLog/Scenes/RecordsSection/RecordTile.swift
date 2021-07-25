//
//  RecordTile.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import Foundation

enum RecordTile: Int {
    case powerliftingx1
    case powerliftingx3
    case powerliftingx5
    case squatx1
    case squatx3
    case squatx5

    var title: String {
        switch self {
        case .powerliftingx1:
            return "Powerlifting"
        case .powerliftingx3:
            return "Powerlifting x3"
        case .powerliftingx5:
            return "Powerlifting x5"
        case .squatx1:
            return "Squat x1"
        case .squatx3:
            return "Squat x3"
        case .squatx5:
            return "Squat x5"
        }
    }

    var records: [Record] {
        switch self {
        case .powerliftingx1:
            return [.deadliftx1, .squatX1, .squatX3]
        case .powerliftingx3:
            return [.deadliftx1, .squatX1, .squatX3]
        case .powerliftingx5:
            return [.deadliftx1, .squatX1, .squatX3]
        case .squatx1:
            return [.deadliftx1, .squatX1, .squatX3]
        case .squatx3:
            return [.deadliftx1, .squatX1, .squatX3]
        case .squatx5:
            return [.deadliftx1, .squatX1, .squatX3]
        }
    }
}

extension RecordTile: Identifiable {
    var id: Int { rawValue }
}
