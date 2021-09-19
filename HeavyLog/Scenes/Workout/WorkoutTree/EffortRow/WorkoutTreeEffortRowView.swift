//
//  WorkoutTreeEffortRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import SwiftUI

extension WorkoutTreeView {
    struct EfforSection: View {

        @EnvironmentObject private var viewModel: WorkoutCreatorVM

        private let effort: WorkoutTreeData.Effort

        init(_ effort: WorkoutTreeData.Effort) {
            self.effort = effort
        }

        var body: some View {
            VStack(spacing: 6) {
                ExerciseRow(effort.exerciseName, onPlusTap: addSetRow(to: effort), onSwipe: deleteEffort())

                VStack(alignment: .leading, spacing: 0) {
                    Components.spacingLine(9)
                    ForEach(effort.weightRows) { weightRow in
                        WeightRow(weightRow.text) { deleteSet(from: weightRow) }
                    }
                    Components.spacingLine(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }

        // MARK: - Interactions

        private func addSetRow(to effort: WorkoutTreeData.Effort) {
            viewModel.addSet(to: effort)
        }

        private func deleteSet(from weightRow: WorkoutTreeData.WeightRow) {
            viewModel.deleteSet(in: effort, from: weightRow)
        }

        private func deleteEffort() {
            viewModel.deleteEffort(effort)
        }
    }
}


// MARK: - Preview

//struct WorkoutTreeEffortRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutTreeView.EfforSection
//    }
//}
