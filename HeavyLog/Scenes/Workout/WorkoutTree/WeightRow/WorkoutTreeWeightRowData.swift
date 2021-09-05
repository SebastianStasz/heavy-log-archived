//
//  WorkoutTreeWeightRowData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import Foundation

extension WorkoutTreeData {

    struct WeightRow: Identifiable {
        let weight: Double
        var reps: [Int]

        var id: Double { weight }

        var text: String {
            let reps = reps.map { "x\($0)" }.joined(separator: " ")
            return "\(weight) kg \(reps)"
        }
    }
}
