//
//  RecordTile.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import Foundation

enum RecordTile: Int {
    case powerliftingX1
    case powerliftingX3
    case powerliftingX5
    case squat
    case benchPress
    case deadlift

    var title: String {
        switch self {
        case .powerliftingX1:
            return "Powerlifting"
        case .powerliftingX3:
            return "Powerlifting x3"
        case .powerliftingX5:
            return "Powerlifting x5"
        case .squat:
            return "Squat"
        case .benchPress:
            return "Bench Press"
        case .deadlift:
            return "Deadlift"
        }
    }

    var records: [Record] {
        switch self {
        case .powerliftingX1:
            return Self.powerliftingx1
        case .powerliftingX3:
            return Self.powerliftingx3
        case .powerliftingX5:
            return Self.powerliftingx5
        case .squat:
            return Self.squatSample
        case .benchPress:
            return Self.benchPressSample
        case .deadlift:
            return Self.deadliftSample
        }
    }
}

extension RecordTile: Identifiable {
    var id: Int { rawValue }
}

// MARK: - Sample Data

extension RecordTile {
    static let squatSample: [Record] = [.squatX1, .squatX3, .squatX5]
    static let deadliftSample: [Record] = [.deadliftX1, .deadliftX3, .deadliftX5]
    static let benchPressSample: [Record] = [.benchPressX1, .benchPressX3, .benchPressX5]
    static let powerliftingx1: [Record] = [.squatX1, .benchPressX1, .deadliftX1]
    static let powerliftingx3: [Record] = [.squatX3, .benchPressX3, .deadliftX3]
    static let powerliftingx5: [Record] = [.squatX5, .benchPressX5, .deadliftX5]
}
