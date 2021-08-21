//
//  WorkoutTreeData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import Foundation

struct WorkoutTreeData {

    let efforts: [Effort]

    struct Effort: Identifiable {
        let exerciseName: String
        let setRows: [SetRow]

        var id: String { exerciseName }
    }

    struct SetRow: Identifiable {
        let weight: String
        let reps: String

        var id: String { weight }

        var text: String {
            "\(weight) kg \(reps)"
        }
    }
}


// MARK: - Sample Data

extension WorkoutTreeData {

    static let sample = WorkoutTreeData(efforts: [
        Effort(exerciseName: "Classic deadlift", setRows: [SetRow(weight: "160", reps: "x2 x2"), SetRow(weight: "145", reps: "x5 x5")]),
        Effort(exerciseName: "Bench press", setRows: [SetRow(weight: "100", reps: "x5 x5 x4"), SetRow(weight: "90", reps: "x5 x5")]),
        Effort(exerciseName: "Overhand pull-ups", setRows: [SetRow(weight: "15", reps: "x6 x6 x6"), SetRow(weight: "0", reps: "x8 x8")]),
        Effort(exerciseName: "Overhead press", setRows: [SetRow(weight: "50", reps: "x8 x8 x8 x8")])
    ])
}
