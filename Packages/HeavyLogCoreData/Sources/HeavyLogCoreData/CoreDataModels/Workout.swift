//
//  Workout.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import Foundation

public struct Workout {
    let title: String
    let notes: String?
    let startDate: Date
    let endDate: Date
    var efforts: [Effort]
    let rate: WorkoutRate
}

// MARK: - Sample Data

public extension Workout {
    static let sample1 = Workout(title: "FBW A", notes: "This is a sample workout.", startDate: Date(), endDate: Date().addingTimeInterval(.init(100)), efforts: [], rate: .good)
    static let sample2 = Workout(title: "PUSH B", notes: nil, startDate: Date(), endDate: Date().addingTimeInterval(.init(300)), efforts: [], rate: .bad)
}
