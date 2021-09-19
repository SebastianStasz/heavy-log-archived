//
//  WorkoutCreatorNavigator.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import Foundation

final class WorkoutCreatorNavigator: ObservableObject {

    enum Destination {
        case workoutTree
        case workoutInfo
        case exerciseList
        case dismissExerciseList
        case abortWorkoutPopup
        case dismissCreator
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
        case .abortWorkoutPopup:
            presentAbortWorkoutCreatorPopup()
        case .dismissCreator:
            AppController.shared.dismissSheet()
        }
    }
}

// MARK: - Helpers

extension WorkoutCreatorNavigator {
    private var controller: AppController { AppController.shared }

    private func presentAbortWorkoutCreatorPopup() {
        let info = PopupModel.Info(title: .workoutCreator_deleteWorkout_title, message: .workoutCreator_deleteWorkout_message)
        let popup = PopupModel.action(info, action: abortWorkoutCreator, isDestructive: true)
        controller.present(popup: popup)
    }

    private func abortWorkoutCreator() {
        navigate(to: .dismissCreator)
        controller.abortWorkoutCreator()
    }
}
