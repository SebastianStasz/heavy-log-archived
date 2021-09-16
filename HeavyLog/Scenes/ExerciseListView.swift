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
    private let onTap: ((ExerciseEntity) -> Void)?

    init(paddingTop: CGFloat, notIncluding exercises: [ExerciseEntity] = [], onTap: ((ExerciseEntity) -> Void)? = nil) {
        self.paddingTop = paddingTop
        self.onTap = onTap
        self._exercises = ExerciseEntity.exercises(notIncluding: exercises)
    }

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(exercises) { exercise in
                Button(action: { onTap?(exercise) }) {
                    ExerciseTileView(viewData: .init(exercise))
                }
            }
        }
        .allowsHitTesting(onTap != nil)
        .padding(top: paddingTop, horizontal: .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }
}


// MARK: - Preview

struct ExerciseListView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(paddingTop: .spacingSmall)
    }
}
