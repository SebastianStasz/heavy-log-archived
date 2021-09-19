//
//  WorkoutTreeView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct WorkoutTreeView: View {
    typealias Components = WorkoutTreeView

    @Environment(\.managedObjectContext) private var context
    @EnvironmentObject var viewModel: WorkoutCreatorVM

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            ForEach(viewModel.workoutTreeData.efforts, content: EfforSection.init)

            ButtonRow(.workoutCreator_addExercise, action: showExerciseList)
            Components.spacingLine(30)
            ButtonRow(.workoutCreator_finishWorkout, action: finishWorkout)

            Spacer().layoutPriority(1)
        }
        .padding(top: .spacingBig, horizontal: .spacingMedium)
        .embedInScrollView()
        .environmentObject(viewModel)
        .sheet(isPresented: $viewModel.navigator.isExerciseListPresented) { exerciseList }
    }

    private var exerciseList: some View {
        ExerciseListView(paddingTop: .spacingMedium, notIncluding: viewModel.exercisesInUse, onTap: addExercise)
            .environment(\.managedObjectContext, context)
            .toolbar { Toolbar.cancel(action: dismissExerciseList) }
            .embedInNavigationView(title: .workoutCreator_exerciseList_title, displayMode: .inline)
    }

    // MARK: - Interactions

    private func addExercise(_ exerciseEntity: ExerciseEntity) {
        viewModel.addEffort(with: exerciseEntity)
    }

    private func showExerciseList() {
        viewModel.navigator.navigate(to: .exerciseList)
    }

    private func dismissExerciseList() {
        viewModel.navigator.navigate(to: .dismissExerciseList)
    }

    private func finishWorkout() {
        viewModel.finishWorkout()
    }
}


// MARK: - Preview

struct WorkoutTreeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WorkoutCreatorVM()
        viewModel.workoutForm = .sample1

        return WorkoutTreeView()
            .environmentObject(viewModel)
            .previewSizeThatFits(backgroundColor: .backgroundMain)
    }
}
