//
//  WorkoutTreeData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation

struct WorkoutTreeData {
    var efforts: [WorkoutTreeData.Effort] = []

    mutating func addSet(_ set: Set, to effort: Effort) {
        guard let index = getIndex(of: effort) else { return }
        efforts[index].addSet(set)
    }

    private func getIndex(of effort: Effort) -> Int? {
        guard let index = efforts.firstIndex(where: { $0.id == effort.id }) else {
            assertionFailure("WorkoutTreeData: No index of \(effort)")
            return nil
        }
        return index
    }

    struct Set {
        let weight: Double
        let reps: Int
    }
}
