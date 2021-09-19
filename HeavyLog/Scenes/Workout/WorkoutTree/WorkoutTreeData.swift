//
//  WorkoutTreeData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation

struct WorkoutTreeData {
    private(set) var efforts: [Effort] = []

    mutating func addSet(_ set: Set, to effort: Effort) {
        guard let index = getIndex(of: effort) else { return }
        efforts[index].addSet(set)
    }

    mutating func deleteLastSet(in weightRow: WeightRow, from effort: Effort) {
        guard let index = getIndex(of: effort) else { return }
        efforts[index].deleteLastSet(from: weightRow)
    }

    mutating func addEffort(_ effort: Effort) {
        efforts.append(effort)
    }

    mutating func deleteEffort(_ effort: Effort) {
        guard let index = getIndex(of: effort) else { return }
        efforts.remove(at: index)
    }
}

// MARK: - Helpers

extension WorkoutTreeData {

    private func getIndex(of effort: Effort) -> Int? {
        guard let index = efforts.firstIndex(where: { $0.id == effort.id }) else {
            assertionFailure("WorkoutTreeData: No index of \(effort)")
            return nil
        }
        return index
    }

    // MARK: - Set

    struct Set {
        let weight: Double
        let reps: Int
    }
}
