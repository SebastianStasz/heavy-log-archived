//
//  ExerciseListView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 10/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseListView: View {

    @Environment(\.managedObjectContext) private var context
    @FetchRequest private var exercises: FetchedResults<ExerciseEntity>

    private let paddingTop: CGFloat
    private let tileIcon: ExerciseTileViewData.Icon
    private let onTap: ((ExerciseEntity) -> Void)?

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(exercises) { exercise in
                Button(action: { onTap?(exercise) }) {
                    ExerciseTileView(viewData: .init(title: exercise.name, icon: tileIcon))
                }
            }
        }
        .allowsHitTesting(onTap != nil)
        .padding(top: paddingTop, horizontal: .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }

    init(paddingTop: CGFloat,
         notIncluding exercises: [ExerciseEntity] = [],
         tileIcon: ExerciseTileViewData.Icon = .chevron,
         onTap: ((ExerciseEntity) -> Void)? = nil
    ) {
        self.paddingTop = paddingTop
        self.tileIcon = tileIcon
        self.onTap = onTap
        self._exercises = ExerciseEntity.exercises(notIncluding: exercises)
    }
}


// MARK: - Preview

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(paddingTop: .spacingSmall)
    }
}
