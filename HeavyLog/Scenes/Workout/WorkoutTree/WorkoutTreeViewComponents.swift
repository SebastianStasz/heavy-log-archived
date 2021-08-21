//
//  WorkoutTreeViewComponents.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import SwiftUI

extension WorkoutTreeView {

    // MARK: - Effort Section

    struct EfforSection: View {
        private let effort: WorkoutTreeData.Effort

        init(_ effort: WorkoutTreeData.Effort) {
            self.effort = effort
        }

        var body: some View {
            VStack(spacing: 6) {
                ExerciseRow(effort.exerciseName, action: {})

                VStack(alignment: .leading, spacing: 0) {
                    Components.spacingLine(9)
                    ForEach(effort.setRows) { EffortRow($0.text) }
                    Components.spacingLine(8)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    // MARK: - Exercise Row

    struct ExerciseRow: View {
        private let title: String
        private let action: () -> Void

        init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

        var body: some View {
            HStack(spacing: .spacingMedium) {
                circle

                Text(title).textBodyMedium

                Spacer()

                Button(action: action) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    // MARK: - Effort Row

    struct EffortRow: View {
        private let text: String

        init(_ text: String) {
            self.text = text
        }

        var body: some View {
            ZStack(alignment: .leading) {
                spacingLine()

                Text(text).textBodyNormal
                    .padding(bottom: .spacingMedium, leading: .spacingHuge)
            }
        }
    }

    // MARK: - Button Row

    struct ButtonRow: View {
        private let title: String
        private let action: () -> Void

        init(_ title: String, action: @escaping () -> Void) {
            self.title = title
            self.action = action
        }

        var body: some View {
            HStack(spacing: .spacingMedium) {
                Components.circle

                Button(title, action: action)
                    .buttonStyle(BaseButtonStyle())

                Spacer()
            }
        }
    }

    // MARK: - Helpers

    static var circle: some View {
        Circle().fillColor(.accentGrayMain).size(10)
    }

    static func spacingLine(_ height: CGFloat? = nil) -> some View {
        ZStack { circle.hidden() ; line }.maxHeight(height ?? .infinity)
    }

    private static var line: some View {
        Rectangle().fillColor(.accentGrayMain).maxWidth(1)
    }
}
