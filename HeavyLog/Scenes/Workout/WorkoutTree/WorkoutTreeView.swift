//
//  WorkoutTreeView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import SwiftUI

struct WorkoutTreeView: View {

    @EnvironmentObject var viewModel: WorkoutCreatorVM

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {

            ForEach(viewModel.workoutTreeData.efforts) { effort in
                VStack(spacing: 6) {
                    headerRow(text: effort.exerciseName)

                    VStack(alignment: .leading, spacing: 0) {
                        spacingLine(height: 9)
                        ForEach(effort.setRows) { row in
                            effortRow(text: row.text)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }

            rowButton(text: "Add Exercise")
            spacingLine(height: 20)
            rowButton(text: "Finish workout")

            Spacer().layoutPriority(1)
        }
    }

    private func headerRow(text: String) -> some View {
        HStack(spacing: .spacingMedium) {
            circle
            Text(text).textBodyMedium
            Spacer()
            Button {} label: {
                Image(systemName: "plus")
            }
        }
    }

    private func rowButton(text: String) -> some View {
        HStack(spacing: .spacingMedium) {
            circle
            Button(text) {}
                .buttonStyle(BaseButtonStyle())
            Spacer()
        }
    }

    private func effortRow(text: String) -> some View {
        ZStack(alignment: .leading) {
            spacingLine()
            Text(text).textBodyNormal
                .padding(bottom: .spacingMedium, leading: .spacingHuge)
        }
    }

    // MARK: - Helpers

    private func spacingLine(height: CGFloat? = nil) -> some View {
        ZStack { circle.hidden() ; line }.height(height ?? .infinity)
    }

    private var line: some View {
        Rectangle().fillColor(.accentGrayMain).width(1)
    }

    private var circle: some View {
        Circle().fillColor(.accentGrayMain).size(10)
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
