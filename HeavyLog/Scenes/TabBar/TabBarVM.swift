//
//  TabBarVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Foundation
import HeavyLogCoreData

final class TabBarVM: ObservableObject {
    typealias Tab = TabBarModel

    @Published var selectedTab: Tab = .dashboard
    @Published var arePopupsShown = false

    private let startWorkout: (WorkoutTemplateEntity?) -> Void

    init(startWorkout: @escaping (WorkoutTemplateEntity?) -> Void) {
        self.startWorkout = startWorkout
    }

    private var controller: AppController {
        AppController.shared
    }

    var availableTabs: [Tab] { Tab.allCases }
}

// MARK: - Navigator

extension TabBarVM {

    enum Destination {
        case tab(Tab)
        case popupItems
        case view
        case workoutCreator
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .tab(let tab):
            selectedTab = tab
        case .popupItems:
            arePopupsShown = true
        case .view:
            dismissPopups()
        case .workoutCreator:
            startWorkoutCreatorProcess()
        }
    }

    private func startWorkoutCreatorProcess() {
        controller.isWorkoutStarted
            ? presentWorkoutCreator()
            : chooseWorkoutTemplateIfNeeded()
    }

    private func chooseWorkoutTemplateIfNeeded() {
        guard let templates = workoutTemplates, templates.isNotEmpty else {
            presentWorkoutCreator() ; return
        }
        controller.present(actionSheet: .chooseWorkoutTemplate(action: startWorkout, templates: templates))
        dismissPopups()
    }

    private var workoutTemplates: [WorkoutTemplateEntity]? {
        WorkoutTemplateEntity.getRecentlyUsedTemplates(from: controller.context, upTo: 3)
    }

    private func presentWorkoutCreator() {
        startWorkout(nil)
        dismissPopups()
    }

    private func dismissPopups() {
        arePopupsShown = false
    }
}
