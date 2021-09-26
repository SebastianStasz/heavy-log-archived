//
//  ExerciseList.swift
//  ExerciseList
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import SwiftUI
import HeavyLogCoreData

struct ExerciseList: View {

    @Environment(\.managedObjectContext) private var context
    @FetchRequest var exercises: FetchedResults<ExerciseEntity>
    @ObservedObject private var viewModel: ExerciseListVM

    private let paddingTop: CGFloat
    private let tileIcon: ExerciseTileViewData.Icon

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(exercises) { exercise in
                Button(action: { viewModel.onTap?(exercise) }) {
                    ExerciseTileView(viewData: .init(title: exercise.name, icon: tileIcon))
                }
            }
        }
        .allowsHitTesting(viewModel.onTap != nil)
        .padding(top: paddingTop, horizontal: .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }

    // MARK: - Initializer

    init(viewModel: ExerciseListVM,
         fetchRequest: FetchRequest<ExerciseEntity>,
         paddingTop: CGFloat,
         tileIcon: ExerciseTileViewData.Icon = .chevron
    ) {
        self.viewModel = viewModel
        self._exercises = fetchRequest
        self.paddingTop = paddingTop
        self.tileIcon = tileIcon
    }
}


// MARK: - Preview

struct ExerciseList_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseList(viewModel: .init(), fetchRequest: ExerciseEntity.all(), paddingTop: 0)
    }
}
