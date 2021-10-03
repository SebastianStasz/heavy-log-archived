//
//  ExerciseList.swift
//  ExerciseList
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseList: View {
    typealias FilteringTabs = ExerciseListNavigator.Tab

    @Environment(\.managedObjectContext) private var context
    @FetchRequest private var exercises: FetchedResults<ExerciseEntity>
    @ObservedObject private var viewModel: ExerciseListVM

    private let tileIcon: ExerciseTileViewData.Icon

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            Picker("", selection: $viewModel.navigator.selectedTab) {
                ForEach(FilteringTabs.allCases) { Text($0.title).tag($0) }
            }
            .pickerStyle(.segmented)
            .displayIf(viewModel.areUserExercises)

            ForEach(exercises) { exercise in
                Button(action: { selectExercise(exercise) }) {
                    ExerciseTileView(viewData: .init(title: exercise.name, icon: tileIcon))
                }
            }
        }
        .padding(.horizontal, .spacingMedium)
        .padding(.bottom, .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }

    private func selectExercise(_ exerciseEntity: ExerciseEntity) {
        viewModel.input.didTapExercise.send(exerciseEntity)
    }

    // MARK: - Initializer

    init(viewModel: ExerciseListVM,
         fetchRequest: FetchRequest<ExerciseEntity>,
         tileIcon: ExerciseTileViewData.Icon = .chevron
    ) {
        self.viewModel = viewModel
        self._exercises = fetchRequest
        self.tileIcon = tileIcon
    }
}


// MARK: - Preview

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList(viewModel: .init(), fetchRequest: ExerciseEntity.all())
    }
}
