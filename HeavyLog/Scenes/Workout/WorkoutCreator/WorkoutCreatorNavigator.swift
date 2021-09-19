//
//  WorkoutCreatorNavigator.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import Foundation
import HeavyLogCoreData

final class WorkoutCreatorNavigator: ObservableObject {

    enum Destination {
        case workoutTree
        case workoutInfo
        case exerciseList
        case dismissExerciseList
        case addSetPopup(Effort, (WorkoutSet, Effort) -> Void)
        case abortWorkoutPopup
        case dismissCreator
        case finishWorkout
    }

    @Published var selectedTab: WorkoutCreator = .workoutTree
    @Published var isExerciseListPresented = false

    func navigate(to destination: Destination) {
        switch destination {
        case .workoutTree:
            selectedTab = .workoutTree
        case .workoutInfo:
            selectedTab = .workoutInfo
        case .exerciseList:
            isExerciseListPresented = true
        case .dismissExerciseList:
            isExerciseListPresented = false
        case let .addSetPopup(effort, action):
            presentAddSetPopup(for: effort, action: action)
        case .abortWorkoutPopup:
            presentAbortWorkoutCreatorPopup()
        case .dismissCreator:
            dismissWorkoutCreator()
        case .finishWorkout:
            abortWorkoutCreator()
        }
    }
}

// MARK: - Helpers

extension WorkoutCreatorNavigator {

    private func presentAbortWorkoutCreatorPopup() {
        let info = PopupModel.Info(title: .workoutCreator_deleteWorkout_title, message: .workoutCreator_deleteWorkout_message)
        let popup = PopupModel.action(info, action: abortWorkoutCreator, isDestructive: true)
        controller.present(popup: popup)
    }

    private func abortWorkoutCreator() {
        dismissWorkoutCreator()
        controller.abortWorkoutCreator()
    }

    private func presentAddSetPopup(for effort: Effort, action: @escaping (WorkoutSet, Effort) -> Void) {
        let popup = PopupModel.addSet(to: effort.exerciseName) { weight, reps in
            let set = WorkoutSet(weight: Double(weight)!, reps: reps)
            action(set, effort)
        }
        controller.present(popup: popup)
    }

    private func dismissWorkoutCreator() {
        controller.dismissSheet()
    }
}

extension WorkoutCreatorNavigator: WorkoutCreatorHelper {}
