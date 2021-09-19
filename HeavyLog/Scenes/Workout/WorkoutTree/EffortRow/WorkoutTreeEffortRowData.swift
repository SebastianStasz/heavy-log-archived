//
//  WorkoutTreeEffortRowData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import HeavyLogCoreData
import Foundation

extension WorkoutTreeData {

    struct Effort: Identifiable {
        let exercise: ExerciseEntity
        var weightRows: [WeightRow]

        init(exercise: ExerciseEntity, weightRows: [WeightRow] = []) {
            self.exercise = exercise
            self.weightRows = weightRows
        }

        var exerciseName: String { exercise.name }
        var id: String { exerciseName }

        mutating func addSet(_ set: Set) {
            if let index = weightRows.firstIndex(where: { $0.weight == set.weight }) {
                weightRows[index].reps.append(set.reps)
            } else {
                let wieghtRow = WeightRow(weight: set.weight, reps: [set.reps])
                weightRows.append(wieghtRow)
            }
        }

        mutating func deleteLastSet(from weightRow: WeightRow) {
            let index = weightRows.firstIndex(where: { $0.id == weightRow.id })!
            weightRows[index].reps.removeLast()
            if weightRows[index].reps.isEmpty {
                weightRows.remove(at: index)
            }
        }
    }
}
