//
//  SetData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 15/08/2021.
//

import Foundation

public struct SetData {
    let reps: Int
    let weight: Double
}

// MARK: - Sample data

public extension SetData {
    static let sample1 = SetData(reps: 10, weight: 50)
    static let sample2 = SetData(reps: 5, weight: 100)
    static let sample3 = SetData(reps: 1, weight: 200)
    static let sample4 = SetData(reps: 4, weight: 100)
    static let sample5 = SetData(reps: 3, weight: 90)
    static let sample6 = SetData(reps: 4, weight: 140)
    static let sample7 = SetData(reps: 6, weight: 120)
    static let sample8 = SetData(reps: 8, weight: 10)
    static let sample9 = SetData(reps: 10, weight: 0)
    static let sample10 = SetData(reps: 8, weight: 0)

    static let sampleBenchPress: [SetData] = [.sample2, .sample2, .sample2, sample4, sample5]
    static let sampleClassicDeadlift: [SetData] = [.sample6, .sample6, .sample7, sample7, sample7]
    static let sampleOverheadPress: [SetData] = [.sample1, .sample1, .sample1, sample1]
    static let samplePullupsOverhand: [SetData] = [.sample8, .sample8, .sample9, sample9, sample10]
}
