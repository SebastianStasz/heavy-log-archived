//
//  ExercisesVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/09/2021.
//

import Combine
import HeavyLogCoreData
import Foundation

final class ExercisesVM: ObservableObject {

    private var cancellables: Set<AnyCancellable> = []
    let exerciseListVM = ExerciseListVM()
    @Published var exerciseDetailsVM: ExerciseDetailsVM?

    init() {
        exerciseListVM.input.didTapExercise
            .sink { [weak self] exercise in
                self?.exerciseDetailsVM = .init(exerciseEntity: exercise)
            }
            .store(in: &cancellables)
    }
}
