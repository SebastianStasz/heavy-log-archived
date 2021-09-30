//
//  WorkoutTreeView+WeightRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 05/09/2021.
//

import SwiftUI

extension WorkoutTreeView {
    struct WeightRowView: View {

        @State private var swipePosition: CGFloat = 0
        private let text: String
        private let swipeAction: () -> Void

        init(_ text: String, swipeAction: @escaping () -> Void) {
            self.text = text
            self.swipeAction = swipeAction
        }

        var body: some View {
            ZStack(alignment: .leading) {
                spacingLine()

                HStack(spacing: 0) {
                    Text(fixedPart).textBodyNormal
                    Text(swipeablePart).textBodyNormal.offset(x: swipePosition)
                }
                .padding(bottom: .spacingMedium, leading: .spacingHuge)
            }
            .gesture(
                DragGesture().onChanged(dragChanged).onEnded(dragEnded)
            )
        }

        private var fixedPart: String.SubSequence {
            text.prefix(text.count - 2)
        }

        private var swipeablePart: String.SubSequence {
            text.suffix(2)
        }

        // MARK: - Interactions

        private func dragChanged(_ value: DragGesture.Value) {
            guard value.translation.width < 0 else { return }
            swipePosition = value.translation.width
        }

        private func dragEnded(_ value: DragGesture.Value) {
            if value.translation.width < -70 { swipeAction() }
            swipePosition = 0
        }
    }
}


// MARK: - Preview

struct WorkoutTreeEffortRowView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTreeView.WeightRowView("", swipeAction: {})
    }
}
