//
//  WorkoutCreatorVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import Foundation

final class WorkoutCreatorVM: ObservableObject {
    typealias Tab = WorkoutCreator

    var availableTabs: [Tab] { Tab.allCases }
}

// MARK: - Navigator

extension WorkoutCreatorVM {

    enum Destination {
        case dismiss
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .dismiss:
            AppController.shared.dismissSheet()
        }
    }
}
