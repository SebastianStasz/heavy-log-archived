//
//  WorkoutCreatorVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Foundation

final class WorkoutCreatorVM: ObservableObject {
    typealias Tab = WorkoutCreator

    @Published var selectedTab: WorkoutCreator = .workoutTree
    @Published var workout = WorkoutForm()

    @Published var workoutTreeData = WorkoutTreeData.sample

    var availableTabs: [Tab] { Tab.allCases }
}

// MARK: - Navigator

extension WorkoutCreatorVM {

    enum Destination {
        case workoutTree
        case workoutInfo
        case dismiss
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .workoutTree:
            selectedTab = .workoutTree
        case .workoutInfo:
            selectedTab = .workoutInfo
        case .dismiss:
            AppController.shared.dismissSheet()
        }
    }
}
