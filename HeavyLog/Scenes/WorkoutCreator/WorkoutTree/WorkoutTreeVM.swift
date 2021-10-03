//
//  WorkoutTreeVM.swift
//  WorkoutTreeVM
//
//  Created by Sebastian Staszczyk on 28/09/2021.
//

import Combine
import HeavyLogCoreData
import Foundation

final class WorkoutTreeVM: ObservableObject, WorkoutCreatorHelper {

    struct Input {
        let deleteEffort = PassthroughSubject<Effort, Never>()
        let addSetToEffort = PassthroughSubject<Effort, Never>()
        let deleteSet = PassthroughSubject<(Effort, WeightRow), Never>()
        let showExerciseList = PassthroughSubject<Void, Never>()
        let dismissExerciseList = PassthroughSubject<Void, Never>()
        let finishWorkout = PassthroughSubject<Void, Never>()
    }

    struct Output {
        let finishWorkout: AnyPublisher<Void, Never>
    }

    let input = Input()
    private var cancellables: Set<AnyCancellable> = []
    private let controller: AppController
    @Published var isExerciseListPresented = false
    @Published var workoutTreeData = WorkoutTreeData()
    let exerciseListVM = ExerciseListVM()

    init(controller: AppController = .shared) {
        self.controller = controller
        bindEvents()
    }

    var workoutIsNotEmpty: Bool {
        workoutTreeData.efforts.first?.weightRows.isNotEmpty ?? false
    }

    private func bindEvents() {
        input.showExerciseList
            .sink { [unowned self] in isExerciseListPresented = true }
            .store(in: &cancellables)

        input.dismissExerciseList
            .sink { [unowned self] in isExerciseListPresented = false }
            .store(in: &cancellables)

        exerciseListVM.input.didTapExercise
            .sink { [unowned self] exercise in
                isExerciseListPresented = false
                workoutTreeData.addEffort(withExercise: exercise)
                updateExercisesInUse()
            }
            .store(in: &cancellables)

        input.deleteEffort
            .sink { [unowned self] effort in
                let deleteEffort = { workoutTreeData.deleteEffort(effort) ; updateExercisesInUse() }
                guard effort.weightRows.isEmpty else {
                    let info = PopupModel.Info(title: "Delete \(effort.exerciseName)", message: "Are you sure you want to delete this exercise with all sets?")
                    let popup = PopupModel.action(info, action: deleteEffort, isDestructive: true)
                    controller.present(popup: popup)
                    return
                }
                deleteEffort()
            }
            .store(in: &cancellables)

        input.addSetToEffort
            .sink { [unowned self] effort in
                let popup = PopupModel.addSet(to: effort.exerciseName) { weight, reps in
                    let set = WorkoutSet(weight: Double(weight)!, reps: reps)
                    workoutTreeData.addSet(set, to: effort)
                }
                controller.present(popup: popup)
            }
            .store(in: &cancellables)

        input.deleteSet
            .sink { [unowned self] (effort, weightRow) in
                workoutTreeData.deleteLastSet(in: weightRow, from: effort)
            }
            .store(in: &cancellables)
    }

    private func updateExercisesInUse() {
        exerciseListVM.notIncludingExercises = workoutTreeData.efforts.map { $0.exercise }
    }
}
