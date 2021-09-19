//
//  WorkoutTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct WorkoutTileViewData {
    let headerViewData: DoubleTextHeaderViewData
    let doubleTextRows: [DoubleTextViewData]

    init(title: String, date: String, color: Color, efforts: [(String, String)]) {
        assert(efforts.isNotEmpty, "Initialization with an empty efforts array should not happend.")
        headerViewData = .init(title: title, subtitle: date, color: color)
        doubleTextRows = efforts.map { .init($0.0, $0.1) }
    }

    init(workout: WorkoutEntity) {
        var result = ""
        var nrOfSets = 0
        var lastWeight: Double = 1000
        var lastNrOfReps: Int = 1000

        let appendToResult = {
            let nrOfSets = nrOfSets == 1 ? "" : nrOfSets.asString
            result += " \(nrOfSets)x\(lastNrOfReps.asString)"
        }

        let efforts = workout.efforts.map { effort -> (String, String) in
            let sets = effort.sets.sorted(by: { $0.weight > $1.weight }).sorted(by: { $0.reps > $1.reps })
            for set in sets {
                if set.weight < lastWeight {
                    if nrOfSets != 0 {
                        appendToResult()
                        result += ", "
                    }
                    lastWeight = set.weight
                    result += "\(String(format:"%g", set.weight))kg"
                    nrOfSets = 1
                    lastNrOfReps = set.reps
                } else if set.reps < lastNrOfReps {
                    appendToResult()
                    nrOfSets = 1
                    lastNrOfReps = set.reps
                } else {
                    nrOfSets += 1
                }

                if set == sets.last {
                    appendToResult()
                }
            }
            return (effort.exerciseName, result)
        }
        self.init(title: workout.title, date: workout.endDate.string(format: .medium), color: workout.rate.color, efforts: efforts)
    }

    func isLast(_ row: DoubleTextViewData) -> Bool {
        doubleTextRows.last == row
    }
}


// MARK: - Sample Data

extension WorkoutTileViewData {
    static private let efforts = [("Deadlift", "150kg 3x1, 150kg x3 x2"), ("OHP", "40kg 4x8"), ("Machine leg extensions", "11kg 4x10"), ("Dumbbell rowing", "27.5kg 4x8")]
    static let sample1 = Self.init(title: "FBW A", date: Date().string(format: .medium), color: .accentOrangeLight, efforts: Self.efforts)
}
