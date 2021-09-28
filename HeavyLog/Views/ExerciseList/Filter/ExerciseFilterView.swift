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
    @ObservedObject var viewModel: ExerciseListVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingHuge) {
            SegmentedPicker("", selection: $viewModel.filterVM.section, options: ExerciseSection.allCases)
                .withTitle("Section")

            SegmentedPicker("", selection: $viewModel.filterVM.type, options: ExerciseType.allCases)
                .withTitle("Type")

            SegmentedPicker("", selection: $viewModel.filterVM.difficulty, options: Difficulty.allCases)
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
    }

    // MARK: - Interactions

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.close(action: dismiss.callAsFunction)
        }
    }

    private func resetFilterToDefault() {
        viewModel.filterVM.resetToDefault()
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
        ExerciseFilterView(viewModel: ExerciseListVM())
            .embedInNavigationView(title: "Filter exercise", displayMode: .inline)
    }
}
