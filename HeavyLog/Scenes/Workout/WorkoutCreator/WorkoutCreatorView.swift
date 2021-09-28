//
//  WorkoutCreatorView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI
import Shared

struct WorkoutCreatorView: View {

    @ObservedObject private var viewModel: WorkoutCreatorVM

    init(viewModel: WorkoutCreatorVM) {
        self.viewModel = viewModel
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        TabView(selection: $viewModel.navigator.selectedTab) {
            ForEach(viewModel.availableTabs) { $0 }
                .background(Color.backgroundMain)
        }
        .toolbar { toolbarContent }
        .environmentObject(viewModel)
        .embedInNavigationView(title: "Workout Name", displayMode: .inline)
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.close(action: dismissCreator)
            Toolbar.delete(action: presentPopupToDeleteWorkout)
        }
    }

    // MARK: - Interactions

    private func dismissCreator() {
        viewModel.navigator.navigate(to: .dismissCreator)
    }

    private func presentPopupToDeleteWorkout() {
        viewModel.navigator.navigate(to: .abortWorkoutPopup)
    }
}


// MARK: - Preview

struct WorkoutCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatorView(viewModel: WorkoutCreatorVM())
    }
}
