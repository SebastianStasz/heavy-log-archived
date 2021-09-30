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
    let workoutTreeVM = WorkoutTreeVM()
    let workoutInfoVM = WorkoutInfoVM()

    init(using template: WorkoutTemplateEntity? = nil) {
        if let template = template {
            fillWorkoutData(using: template)
        }

        let workoutTreeOutput = workoutTreeVM.makeOutput()

        workoutTreeOutput.finishWorkout
            .sink { [weak self] in self?.finishWorkout() }
            .store(in: &cancellables)
    }

    private func finishWorkout() {
        workoutInfoVM.form.endDate = Date()
        let workoutData = getWorkoutData()
        WorkoutEntity.create(in: controller.context, workoutData: workoutData)
        navigator.navigate(to: .finishWorkout)
    }

    private func getWorkoutData() -> WorkoutData {
        let form = workoutInfoVM.form
        let title = form.title.isNotEmpty ? form.title : "Workout \(form.endDate.string(format: .medium))"
        let efforts = workoutTreeVM.workoutTreeData.efforts.map { $0.effortData }
        return WorkoutData(title: title, notes: form.notes, startDate: form.startDate, endDate: Date(), efforts: efforts, rate: form.rate)
    }

    private func fillWorkoutData(using template: WorkoutTemplateEntity) {
        for exercise in template.exercises {
            workoutTreeVM.workoutTreeData.addEffort(withExercise: exercise)
        }
        workoutInfoVM.form.title = template.name
        template.wasUsed()
    }
}

// MARK: - Helpers

extension WorkoutCreatorVM: WorkoutCreatorHelper {

    var availableTabs: [Tab] {
        Tab.allCases
    }
}
