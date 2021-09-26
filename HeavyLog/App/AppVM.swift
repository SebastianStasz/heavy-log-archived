//
//  AppVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Combine
import SwiftUI
import HeavyLogCoreData

@main
struct HeavyLogApp: App {

    @State private var context = AppVM.shared.context

    var body: some Scene {
        WindowGroup {
            AppView(appVM: AppVM.shared)
                .environment(\.managedObjectContext, context)
        }
    }
}

var controller: AppController {
    AppController.shared
}

// MARK: - App Controller

final class AppController {
    static let shared = AppController()

    let context = AppVM.shared.context

    private unowned let app: AppVM

    init(appVM: AppVM = AppVM.shared) {
        self.app = appVM
    }

    var isWorkoutStarted: Bool {
        app.workoutCreatorVM != nil
    }

    func present(toast: ToastModel) {
        app.toastPresenter.presentToast(toast)
    }

    func present(alert: AlertModel) {
        guard app.alert == nil else { return }
        app.alert = alert
    }

    func present(actionSheet: ActionSheetModel) {
        guard app.actionSheet == nil else { return }
        app.actionSheet = actionSheet
    }

    func present(sheet: SheetModel) {
        guard app.sheet == nil else { return }
        app.sheet = sheet
    }

    func present(popup: PopupModel) {
        guard app.popup == nil else { return }
        app.popup = popup
    }

    func dismissSheet() {
        app.sheet = nil
    }

    func abortWorkoutCreator() {
        app.workoutCreatorVM = nil
    }
}

// MARK: - App View Model

final class AppVM: ObservableObject {
    static fileprivate let shared = AppVM()

    @Published private(set) var tabBarVM: TabBarVM?
    @Published private(set) var toastPresenter = ToastPresenterVM()
    @Published fileprivate var workoutCreatorVM: WorkoutCreatorVM?
    @Published var actionSheet: ActionSheetModel?
    @Published var sheet: SheetModel?
    @Published var alert: AlertModel?
    @Published var popup: PopupModel?

    let context = PersistenceController.previewEmpty.context
    private var cancellable: AnyCancellable?

    init() {
        tabBarVM = TabBarVM(startWorkout: startWorkout)
        cancellable = ExerciseEntity.loadStaticData(to: context)
//        CoreDataSample.createSampleWorkoutTemplates(in: context)
    }

    func startWorkout(using template: WorkoutTemplateEntity? = nil) {
        guard let vm = workoutCreatorVM else {
            workoutCreatorVM = WorkoutCreatorVM(using: template)
            startWorkout() ; return
        }
        AppController.shared.present(sheet: .workout(viewModel: vm))
    }
}

// MARK: - Navigator

extension AppVM {

    enum Destination {
        case startView
        case appView
    }

    func navigate(to destination: Destination) {
        switch destination {
        case .startView:
            tabBarVM = nil
        case .appView:
            tabBarVM = TabBarVM(startWorkout: startWorkout)
        }
    }
}
