//
//  WorkoutCreatorVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Combine
import Foundation
import HeavyLogCoreData

final class WorkoutCreatorVM: ObservableObject {
    private var cancellables: Set<AnyCancellable> = []

    @Published var navigator = WorkoutCreatorNavigator()
    @Published var workoutInfoListVM = BaseListVM()
    @Published var workoutTreeData = WorkoutTreeData()
    @Published var workoutForm = WorkoutForm()

    init(using template: WorkoutTemplateEntity? = nil) {
        initCombine()
        fillWorkoutData(using: template)
    }

    func addEffort(with exerciseEntity: ExerciseEntity) {
        navigator.navigate(to: .dismissExerciseList)
        let effort = Effort(exercise: exerciseEntity)
        workoutTreeData.addEffort(effort)
    }

    func deleteEffort(_ effort: Effort) {
        workoutTreeData.deleteEffort(effort)
    }

    func addSet(to effort: Effort) {
        let popup = getPopupModel(for: effort)
        AppController.shared.present(popup: popup)
    }

    func deleteSet(in effort: Effort, from weightRow: WeightRow) {
        workoutTreeData.deleteLastSet(in: weightRow, from: effort)
    }

    // MARK: - Private

    private func getPopupModel(for effort: Effort) -> PopupModel {
        PopupModel.addSet(to: effort.exerciseName) { [weak self] weight, reps in
            let set = WorkoutSet(weight: Double(weight)!, reps: reps)
            self?.workoutTreeData.addSet(set, to: effort)
        }
    }

    private func fillWorkoutData(using template: WorkoutTemplateEntity?) {
        guard let template = template else { return }
        for ex in template.exercises { addEffort(with: ex) }
        workoutForm.title = template.name
        template.wasUsed()
    }

    private func initCombine() {
        workoutInfoListVM.objectWillChange.merge(with: navigator.objectWillChange)
            .sink { [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellables)

        $workoutForm
            .sink { [weak self] form in
                self?.workoutInfoListVM.rows = form.info
            }
            .store(in: &cancellables)
    }
}

// MARK: - Helpers

extension WorkoutCreatorVM {
    typealias Tab = WorkoutCreator
    typealias Effort = WorkoutTreeData.Effort
    typealias WorkoutSet = WorkoutTreeData.Set
    typealias WeightRow = WorkoutTreeData.WeightRow

    var availableTabs: [Tab] {
        Tab.allCases
    }
    var exercisesInUse: [ExerciseEntity] {
        workoutTreeData.efforts.map { $0.exercise }
    }
}
