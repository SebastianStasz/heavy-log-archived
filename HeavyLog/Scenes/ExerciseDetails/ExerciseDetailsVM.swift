//
//  ExerciseDetailsVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/09/2021.
//

import HeavyLogCoreData
import Foundation

final class ExerciseDetailsVM: ObservableObject {

    let exerciseEntity: ExerciseEntity

    init(exerciseEntity: ExerciseEntity) {
        self.exerciseEntity = exerciseEntity
    }
}
