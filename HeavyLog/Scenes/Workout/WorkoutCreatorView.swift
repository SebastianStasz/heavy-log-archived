//
//  WorkoutCreatorView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI
import Shared

struct WorkoutCreatorView: View {

    @Environment(\.managedObjectContext) private var context
    @StateObject private var viewModel = WorkoutCreatorVM()

    init() {
        UITabBar.appearance().isHidden = false
    }

    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            ForEach(viewModel.availableTabs) { $0 }
                .background(Color.backgroundMain)
        }
        .toolbar { toolbarContent }
        .environmentObject(viewModel)
        .embedInNavigationView(title: "Workout Name", displayMode: .inline)
        .sheet(isPresented: $viewModel.isExerciseListPresented) {
            exerciseList.environment(\.managedObjectContext, context)
        }
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.cancel(action: dismissCreator)
            Toolbar.delete(action: dismissCreator)
        }
    }

    private var exerciseList: some View {
        ExerciseListView(paddingTop: .spacingMedium)
            .toolbar { Toolbar.cancel(action: toggleExerciseList) }
            .embedInNavigationView(title: .workoutCreator_exerciseList_title, displayMode: .inline)
    }

    // MARK: - Interactions

    private func dismissCreator() {
        viewModel.navigate(to: .dismissCreator)
    }

    private func toggleExerciseList() {
        viewModel.navigate(to: .exerciseList)
    }
}


// MARK: - Preview

struct WorkoutCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatorView()
    }
}
