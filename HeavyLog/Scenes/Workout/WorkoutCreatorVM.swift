//
//  WorkoutCreatorVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Combine
import Foundation

final class WorkoutCreatorVM: ObservableObject {
    typealias Tab = WorkoutCreator

    var availableTabs: [Tab] { Tab.allCases }

    private var cancellables: Set<AnyCancellable> = []

    @Published var selectedTab: WorkoutCreator = .workoutTree
    @Published var workout = WorkoutForm()
    @Published var workoutInfoListVM = BaseListVM()
    @Published var workoutTreeData = WorkoutTreeData.sample
    @Published var isExerciseListPresented = false

    init() {
        catchNestedModelsChanges()

        $workout
            .sink { [weak self] form in
                self?.workoutInfoListVM.rows = form.info
            }
            .store(in: &cancellables)
    }

    private func catchNestedModelsChanges() {
        workoutInfoListVM.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

// MARK: - Navigator

extension WorkoutCreatorVM {

    enum Destination {
        case workoutTree
        case workoutInfo
        case exerciseList
        case dismissCreator
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .workoutTree:
            selectedTab = .workoutTree
        case .workoutInfo:
            selectedTab = .workoutInfo
        case .exerciseList:
            isExerciseListPresented.toggle()
        case .dismissCreator:
            AppController.shared.dismissSheet()
        }
    }
}
