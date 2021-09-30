//
//  WorkoutTreeView+EffortView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import SwiftUI

extension WorkoutTreeView {

    struct EffortView: View {
        @EnvironmentObject private var viewModel: WorkoutTreeVM

        private let effort: WorkoutTreeData.Effort

        init(_ effort: WorkoutTreeData.Effort) {
            self.effort = effort
        }

        var body: some View {
            VStack(spacing: 6) {
                ExerciseRowView(effort.exerciseName, onPlusTap: addSetRow(to: effort), onSwipe: deleteEffort())

                VStack(alignment: .leading, spacing: 0) {
                    Components.spacingLine(9)
                    ForEach(effort.weightRows) { weightRow in
                        WeightRowView(weightRow.text) { deleteSet(from: weightRow) }
                    }
                    Components.spacingLine(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }

        // MARK: - Interactions

        private func addSetRow(to effort: WorkoutTreeData.Effort) {
            viewModel.input.addSetToEffort.send(effort)
        }

        private func deleteSet(from weightRow: WorkoutTreeData.WeightRow) {
            viewModel.input.deleteSet.send((effort, weightRow))
        }

        private func deleteEffort() {
            viewModel.input.deleteEffort.send(effort)
        }
    }
}


// MARK: - Preview

//struct WorkoutTreeEffortRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutTreeView.EffortView
//    }
//}
