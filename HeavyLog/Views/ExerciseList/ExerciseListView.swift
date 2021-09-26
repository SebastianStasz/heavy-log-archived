//
//  ExerciseListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseListView: View {

    @StateObject private var viewModel = ExerciseListVM()

    private let paddingTop: CGFloat
    private let tileIcon: ExerciseTileViewData.Icon
    private let onTap: ((ExerciseEntity) -> Void)?

    var body: some View {
        VStack {
            Picker("", selection: $viewModel.filter.selectedTab) {
                ForEach(ExerciseListVM.Filtering.Tab.allCases) {
                    Text($0.title).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, .spacingMedium)
            .displayIf(viewModel.areUserExercises)

            ExerciseList(viewModel: viewModel, fetchRequest: viewModel.fetchRequest, paddingTop: paddingTop, tileIcon: tileIcon)
        }
        .searchable(text: $viewModel.searchText, prompt: "Search for exercises")
        .onAppear { viewModel.onTap = onTap }
    }

    // MARK: - Initializer

    init(paddingTop: CGFloat,
         tileIcon: ExerciseTileViewData.Icon = .chevron,
         onTap: ((ExerciseEntity) -> Void)? = nil
    ) {
        self.paddingTop = paddingTop
        self.tileIcon = tileIcon
        self.onTap = onTap
    }
}


// MARK: - Preview

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(paddingTop: .spacingSmall)
            .embedInNavigationView(title: "Exercises")
            .environment(\.managedObjectContext, PersistenceController.previewWithData.context)
    }
}
