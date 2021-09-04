//
//  WorkoutCreatorView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI
import Shared

struct WorkoutCreatorView: View {

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
        .sheet(isPresented: $viewModel.isExerciseListPresented) { exerciseList }
        .embedInNavigationView(title: "Workout Name", displayMode: .inline)
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem.cancel { viewModel.navigate(to: .dismiss) }

            ToolbarItem(placement: .navigationBarLeading) {
                Button(.common_delete, action: viewModel.navigate(to: .dismiss))
            }
        }
    }

    private var exerciseList: some View {
        ExercisesView()
            .toolbar { ToolbarItem.cancel { viewModel.navigate(to: .exerciseList) } }
            .embedInNavigationView(title: "Choose an exercise", displayMode: .inline)
    }
}


// MARK: - Preview

struct WorkoutCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCreatorView()
    }
}
