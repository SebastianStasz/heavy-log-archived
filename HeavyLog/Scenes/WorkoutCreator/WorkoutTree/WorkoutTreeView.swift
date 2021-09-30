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
    @EnvironmentObject var viewModel: WorkoutTreeVM

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            ForEach(viewModel.workoutTreeData.efforts, content: EffortView.init)
                .environmentObject(viewModel)

            ButtonRow(.workoutCreator_addExercise, action: showExerciseList)
            Components.spacingLine(30)
            ButtonRow(.workoutCreator_finishWorkout, action: finishWorkout)

            Spacer().layoutPriority(1)
        }
        .padding(top: .spacingBig, horizontal: .spacingMedium)
        .embedInScrollView()
        .sheet(isPresented: $viewModel.isExerciseListPresented) { exerciseList }
    }

    private var exerciseList: some View {
        ExerciseListView(viewModel: viewModel.exerciseListVM, tileIcon: .plus)
            .environment(\.managedObjectContext, context)
            .toolbar { Toolbar.cancel(action: dismissExerciseList) }
            .embedInNavigationView(title: .workoutCreator_exerciseList_title, displayMode: .inline)
    }

    // MARK: - Interactions

    private func showExerciseList() {
        viewModel.input.showExerciseList.send()
    }

    private func dismissExerciseList() {
        viewModel.input.dismissExerciseList.send()
    }

    private func finishWorkout() {
        viewModel.input.finishWorkout.send()
    }
}


// MARK: - Preview

//struct WorkoutTreeView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = WorkoutTreeVM()
//
//        return WorkoutTreeView(viewModel: viewModel)
//            .environmentObject(viewModel)
//            .previewSizeThatFits(backgroundColor: .backgroundMain)
//    }
//}
