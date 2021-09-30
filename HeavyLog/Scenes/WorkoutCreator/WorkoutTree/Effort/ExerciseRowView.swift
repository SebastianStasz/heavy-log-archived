//
//  ExerciseRowView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import SwiftUI

extension WorkoutTreeView {

    struct ExerciseRowView: View {
        @State private var swipePosition: CGFloat = 0

        private let title: String
        private let plusTapAction: () -> Void
        private let swipeAction: () -> Void

        var body: some View {
            HStack(spacing: .spacingMedium) {
                circle

                Text(title).textBodyMedium

                Spacer()

                Button(systemImage: "plus", action: plusTapAction())
                    .buttonStyle(TextButtonStyle(.action))
            }
            .offset(x: swipePosition)
            .contentShape(Rectangle())
            .gesture(DragGesture().onChanged(dragChanged).onEnded(dragEnded))
        }

        // MARK: - Interactions

        private func dragChanged(_ value: DragGesture.Value) {
            guard value.translation.width < 0 else { return }
            swipePosition = value.translation.width
        }

        private func dragEnded(_ value: DragGesture.Value) {
            if value.translation.width < -150 { swipeAction() }
            swipePosition = 0
        }

        // MARK: - Initializer

        init(_ title: String,
             onPlusTap: @autoclosure @escaping () -> Void,
             onSwipe: @autoclosure @escaping () -> Void
        ) {
            self.title = title
            self.plusTapAction = onPlusTap
            self.swipeAction = onSwipe
        }
    }
}


// MARK: - Preview

struct ExerciseRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTreeView.ExerciseRowView("Bench press", onPlusTap: (), onSwipe: ())
    }
}
