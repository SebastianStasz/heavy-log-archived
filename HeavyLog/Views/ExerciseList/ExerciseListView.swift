//
//  ExerciseListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseListView: View {

    @ObservedObject var viewModel: ExerciseListVM

    private let tileIcon: ExerciseTileViewData.Icon

    var body: some View {
        ExerciseList(viewModel: viewModel, fetchRequest: viewModel.fetchRequest, tileIcon: tileIcon)
            .searchable(text: $viewModel.searchText, prompt: String.common_searchForExercises)
            .toolbar { toolbarContent }
            .sheet(item: $viewModel.navigator.sheet) { $0 }
    }

    private var toolbarContent: some ToolbarContent {
        Group {
            Toolbar.trailing(.common_add, action: {})
            Toolbar.leading(.common_filter, action: presentFilterSheet)
        }
    }

    // MARK: - Interactions

    private func presentFilterSheet() {
        viewModel.navigate(to: .exerciseFilterSheet)
    }

    // MARK: - Initializer

    init(viewModel: ExerciseListVM,
         tileIcon: ExerciseTileViewData.Icon = .chevron
    ) {
        self.viewModel = viewModel
        self.tileIcon = tileIcon
    }
}


// MARK: - Preview

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(viewModel: .init())
            .embedInNavigationView(title: "Exercises")
            .environment(\.managedObjectContext, PersistenceController.previewWithData.context)
    }
}
