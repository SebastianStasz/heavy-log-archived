//
//  WorkoutTreeView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/08/2021.
//

import HeavyLogCoreData
import SwiftUI

final class WorkoutTreeVM: ObservableObject {

}

struct WorkoutTreeView: View {

    @EnvironmentObject var viewModel: WorkoutCreatorVM

    var body: some View {
        VStack(spacing: 6) {
            headerRow(text: "Sumo Deadlift")

            VStack(spacing: 0) {
                spacingRow

                effortRow(text: "170 kg x5 x5 x5")
                effortRow(text: "170 kg x5 x5 x5")
            }

            headerRow(text: "Sumo Deadlift")

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

    private func effortRow(text: String) -> some View {
        HStack(spacing: .spacingBig) {
            textLeadingLine
            Text(text).textBodyNormal
                .padding(.bottom, 16)
            Spacer()
        }
    }

    // MARK: - Helpers

    private var spacingRow: some View {
        HStack { topSpacingLine ; Spacer() }
    }

    private var textLeadingLine: some View {
        ZStack { circle.hidden() ; lineInfinite }
    }

    private var topSpacingLine: some View {
        ZStack { circle.hidden() ; lineHeight9 }
    }

    private var circle: some View {
        Circle().frame(width: 10, height: 10)
    }

    private var lineHeight9: some View {
        Rectangle().frame(maxWidth: 1, maxHeight: 9)
    }

    private var lineInfinite: some View {
        Rectangle().frame(maxWidth: 1, maxHeight: .infinity)
    }
}


// MARK: - Preview

struct WorkoutTreeView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTreeView()
            .environmentObject(WorkoutTreeVM())
            .previewSizeThatFits()
    }
}
