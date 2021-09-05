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

            ButtonRow("Add exercise", action: showExerciseList)
            Components.spacingLine(20)
            ButtonRow("Finish workout", action: {})

            Spacer().layoutPriority(1)
        }
        .padding(top: .spacingBig, horizontal: .spacingMedium)
        .embedInScrollView()
        .sheet(isPresented: $viewModel.isExerciseListPresented) { exerciseList }
    }

    private var exerciseList: some View {
        ExerciseListView(paddingTop: .spacingMedium, notIncluding: viewModel.exercisesInUse, onTap: addExercise)
            .environment(\.managedObjectContext, context)
            .toolbar { Toolbar.cancel(action: dismissExerciseList) }
            .embedInNavigationView(title: .workoutCreator_exerciseList_title, displayMode: .inline)
    }

    // MARK: - Interactions

    private func addExercise(_ exerciseEntity: ExerciseEntity) {
        viewModel.addExercise(exerciseEntity)
    }

    private func showExerciseList() {
        viewModel.navigate(to: .exerciseList)
    }

    private func dismissExerciseList() {
        viewModel.navigate(to: .dismissExerciseList)
    }
}


// MARK: - Preview

struct WorkoutTreeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WorkoutCreatorVM()
        viewModel.workout = .sample(efforts: EffortData.getSampleEfforts(in: PersistenceController.previewEmpty.context))

        return WorkoutTreeView()
            .environmentObject(viewModel)
            .previewSizeThatFits(backgroundColor: .backgroundMain)
    }
}
