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

    @EnvironmentObject var viewModel: WorkoutCreatorVM

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            ForEach(viewModel.workoutTreeData.efforts, content: EfforSection.init)

            ButtonRow("Add exercise", action: { viewModel.navigate(to: .exerciseList) })
            Components.spacingLine(20)
            ButtonRow("Finish workout", action: {})

            Spacer().layoutPriority(1)
        }
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
