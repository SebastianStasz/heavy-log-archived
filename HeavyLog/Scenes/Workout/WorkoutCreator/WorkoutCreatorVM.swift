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
    private let timer = Timer.publish(every: 60.05, on: .main, in: .default).autoconnect()

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
        navigator.navigate(to: .addSetPopup(effort) { [weak self] set, effort in
            self?.workoutTreeData.addSet(set, to: effort)
        })
    }

    func deleteSet(in effort: Effort, from weightRow: WeightRow) {
        workoutTreeData.deleteLastSet(in: weightRow, from: effort)
    }

    func finishWorkout() {
        workoutForm.endDate = Date()
        WorkoutEntity.create(in: controller.context, workoutData: getWorkoutData())
        navigator.navigate(to: .finishWorkout)
    }

    private func getWorkoutData() -> WorkoutData {
        let title = workoutForm.title.isNotEmpty ? workoutForm.title : "Workout \(workoutForm.endDate.string(format: .medium))"
        let efforts = workoutTreeData.efforts.map { $0.effortData }
        return WorkoutData(title: title, notes: workoutForm.notes, startDate: workoutForm.startDate, endDate: Date(), efforts: efforts, rate: workoutForm.rate)
    }

    // MARK: - Private

    private func initCombine() {
        workoutInfoListVM.objectWillChange.merge(with: navigator.objectWillChange)
            .sink { [weak self] _ in self?.objectWillChange.send() }
            .store(in: &cancellables)

        $workoutForm
            .sink { [weak self] form in
                self?.workoutInfoListVM.rows = form.info
            }
            .store(in: &cancellables)

        timer.sink { [weak self] date in
            self?.workoutForm.updateDuration(for: date)
        }
        .store(in: &cancellables)
    }

    private func fillWorkoutData(using template: WorkoutTemplateEntity?) {
        guard let template = template else { return }
        for ex in template.exercises { addEffort(with: ex) }
        workoutForm.title = template.name
        template.wasUsed()
    }
}

// MARK: - Helpers

extension WorkoutCreatorVM: WorkoutCreatorHelper {

    var availableTabs: [Tab] {
        Tab.allCases
    }
    var exercisesInUse: [ExerciseEntity] {
        workoutTreeData.efforts.map { $0.exercise }
    }
}
