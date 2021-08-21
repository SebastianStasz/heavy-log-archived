//
//  EffortData.swift
//  HeavyLogCoreData
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import Foundation

public struct EffortData {
    let exerciseId: Int
    let exercise: ExerciseEntity
    let sets: [SetData]

    init(exercise: ExerciseEntity, sets: [SetData] = []) {
        self.exercise = exercise
        self.exerciseId = exercise.id_
        self.sets = sets
    }
}
