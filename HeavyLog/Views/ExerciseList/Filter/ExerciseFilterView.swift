//
//  ExerciseFilterView.swift
//  ExerciseFilterView
//
//  Created by Sebastian Staszczyk on 26/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseFilterView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ExerciseFilterVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingHuge) {
            SegmentedPicker("", selection: $viewModel.form.section, options: ExerciseSection.allCases)
                .withTitle("Section")

            SegmentedPicker("", selection: $viewModel.form.type, options: ExerciseType.allCases)
                .withTitle("Type")

            SegmentedPicker("", selection: $viewModel.form.difficulty, options: Difficulty.allCases)
                .withTitle("Difficulty")

            Spacer()

            VStack(spacing: .spacingSmall) {
                Button("Reset", action: resetFilterToDefault)
                    .buttonStyle(BaseButtonStyle(.secondary(.big)))

                Button(.common_filter, action: performFiltering)
                    .buttonStyle(BaseButtonStyle(.action(.big)))
            }
        }
        .padding(.top, .spacingBig)
        .padding(.horizontal, .spacingMedium)
        .toolbar { toolbarContent }
        .embedInNavigationView(title: "Filter exercises", displayMode: .inline)
        .onDisappear { viewModel.input.viewDisappeared.send() }
    }

    // MARK: - Interactions

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.close(action: dismiss.callAsFunction)
        }
    }

    private func resetFilterToDefault() {
        viewModel.input.resetToDefaultBtnTap.send()
    }

    private func performFiltering() {
        viewModel.input.filterBtnTap.send()
    }
}

// MARK: - Segmented Picker with Title

private struct SegmentedPickerWithTitle: ViewModifier {

    let title: String

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: .spacingSmall) {
            Text(title).textHeadlineBig
            content
        }
    }
}

private extension SegmentedPicker {
    func withTitle(_ title: String) -> some View {
        self.modifier(SegmentedPickerWithTitle(title: title))
    }
}


// MARK: - Preview

struct ExerciseFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFilterView(viewModel: ExerciseFilterVM(dismissSheet: {}))
            .embedInNavigationView(title: "Filter exercise", displayMode: .inline)
    }
}
