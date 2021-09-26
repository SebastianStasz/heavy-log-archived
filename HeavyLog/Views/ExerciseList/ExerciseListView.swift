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
            .searchable(text: $viewModel.searchText, prompt: "Search for exercises")
            .onAppear { viewModel.onTap = onTap }
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
