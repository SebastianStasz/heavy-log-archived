//
//  ExercisesVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/09/2021.
//

import Foundation
import HeavyLogCoreData

final class ExercisesVM: ObservableObject {

    @Published var exerciseDetailsVM: ExerciseDetailsVM?

    func open(_ exercise: ExerciseEntity) {
        exerciseDetailsVM = ExerciseDetailsVM(exerciseEntity: exercise)
    }
}
