//
//  WorkoutTemplateData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 18/09/2021.
//

import Foundation

public struct WorkoutTemplateData {
    let name: String
    let exercises: [ExerciseEntity]
    let timesUsed: Int = 0
    let lastUse: Date? = nil

    init(name: String, exercises: [ExerciseEntity] = []) {
        self.name = name
        self.exercises = exercises
    }
}


// MARK: - Sample Data

extension WorkoutTemplateData {
    static let sample1 = WorkoutTemplateData(name: "FBW A")
    static let sample2 = WorkoutTemplateData(name: "Push A")
    static let sample3 = WorkoutTemplateData(name: "Push B")
}
