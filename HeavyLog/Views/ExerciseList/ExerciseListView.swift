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

    private let tileIcon: ExerciseTileViewData.Icon
    private let onTap: ((ExerciseEntity) -> Void)?

    var body: some View {
        ExerciseList(viewModel: viewModel, fetchRequest: viewModel.fetchRequest, tileIcon: tileIcon)
            .searchable(text: $viewModel.searchText, prompt: String.common_searchForExercises)
            .toolbar { toolbarContent }
            .sheet(item: $viewModel.navigator.sheet) { $0 }
            .onAppear { viewModel.onTap = onTap }
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.leading(.common_add, action: {})
            Toolbar.trailing(.common_filter, action: presentFilterSheet)
        }
    }

    // MARK: - Interactions

    private func presentFilterSheet() {
        viewModel.navigator.navigate(to: .exerciseFilterSheet)
    }

    // MARK: - Initializer

    init(tileIcon: ExerciseTileViewData.Icon = .chevron,
         onTap: ((ExerciseEntity) -> Void)? = nil
    ) {
        self.tileIcon = tileIcon
        self.onTap = onTap
    }
}


// MARK: - Preview

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView()
            .embedInNavigationView(title: "Exercises")
            .environment(\.managedObjectContext, PersistenceController.previewWithData.context)
    }
}
