//
//  Effort.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 14/08/2021.
//

import Foundation

struct Effort {
    let exerciseId: Int
    let exercise: ExerciseEntity

    init(exercise: ExerciseEntity) {
        self.exercise = exercise
        self.exerciseId = exercise.id_
    }
}
