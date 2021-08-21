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
}
