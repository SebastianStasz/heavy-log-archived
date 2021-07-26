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
            return Self.samplePowerliftingX1
        case .powerliftingX3:
            return Self.samplePowerliftingX3
        case .powerliftingX5:
            return Self.samplePowerliftingX5
        case .squat:
            return Self.sampleSquat
        case .benchPress:
            return Self.sampleBenchPress
        case .deadlift:
            return Self.sampleDeadlift
        }
    }
}

extension RecordTile: Identifiable {
    var id: Int { rawValue }
}

// MARK: - Sample Data

extension RecordTile {
    static let sampleSquat: [Record] = [.sampleSquatX1, .sampleSquatX3, .sampleSquatX5]
    static let sampleDeadlift: [Record] = [.sampleDeadliftX1, .sampleDeadliftX3, .sampleDeadliftX5]
    static let sampleBenchPress: [Record] = [.sampleBenchPressX1, .sampleBenchPressX3, .sampleBenchPressX5]
    static let samplePowerliftingX1: [Record] = [.sampleSquatX1, .sampleBenchPressX1, .sampleDeadliftX1]
    static let samplePowerliftingX3: [Record] = [.sampleSquatX3, .sampleBenchPressX3, .sampleDeadliftX3]
    static let samplePowerliftingX5: [Record] = [.sampleSquatX5, .sampleBenchPressX5, .sampleDeadliftX5]
}
