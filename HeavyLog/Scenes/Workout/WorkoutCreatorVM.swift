//
//  WorkoutCreatorVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Combine
import HeavyLogCoreData
import Foundation

final class WorkoutCreatorVM: ObservableObject {
    typealias Tab = WorkoutCreator
    typealias Effort = WorkoutTreeData.Effort
    typealias WorkoutSet = WorkoutTreeData.Set
    typealias WeightRow = WorkoutTreeData.WeightRow

    var availableTabs: [Tab] { Tab.allCases }

    private var cancellables: Set<AnyCancellable> = []

    @Published var selectedTab: WorkoutCreator = .workoutTree
    @Published var workout = WorkoutForm()
    @Published var workoutInfoListVM = BaseListVM()
    @Published var workoutTreeData = WorkoutTreeData()
    @Published var isExerciseListPresented = false

    var exercisesInUse: [ExerciseEntity] {
        workoutTreeData.efforts.map { $0.exercise }
    }

    init() {
        catchNestedModelsChanges()

        $workout
            .sink { [weak self] form in
                self?.workoutInfoListVM.rows = form.info
            }
            .store(in: &cancellables)
    }

    func addExercise(_ exerciseEntity: ExerciseEntity) {
        let effort = Effort(exercise: exerciseEntity, weightRows: [])
        workoutTreeData.efforts.append(effort)
        navigate(to: .dismissExerciseList)
    }

    func addSet(to effort: Effort) {
        let popup = PopupModel.addSet(to: effort.exerciseName) { [weak self] weight, reps in
            let set = WorkoutSet(weight: Double(weight)!, reps: reps)
            self?.workoutTreeData.addSet(set, to: effort)
        }
        AppController.shared.present(popup: popup)
    }

    func deleteSet(in effort: Effort, from weightRow: WeightRow) {
        if let effortIndex = workoutTreeData.efforts.firstIndex(where: { $0.id == effort.id }) {
            workoutTreeData.efforts[effortIndex].deleteLastSet(from: weightRow)
        }
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
        case dismissExerciseList
        case dismissCreator
    }

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
        case .dismissCreator:
            AppController.shared.dismissSheet()
        }
    }
}
