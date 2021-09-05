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

    @FetchRequest(fetchRequest: ExerciseEntity.createFetchRequest()
    ) private var exercises: FetchedResults<ExerciseEntity>

    var paddingTop: CGFloat

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(exercises) { exercise in
                ExerciseTileView(viewData: .init(exercise))
            }
        }
        .padding(.top, paddingTop)
        .padding(.horizontal, .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }
}


// MARK: - Preview

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseListView(paddingTop: .spacingSmall)
    }
}
