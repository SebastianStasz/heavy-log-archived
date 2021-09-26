//
//  WorkoutsView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 19/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct WorkoutsView: View {

    @Environment(\.managedObjectContext) private var context
    @FetchRequest private var workouts: FetchedResults<WorkoutEntity>

    init() {
        self._workouts = WorkoutEntity.all(sorting: [.byDate(.reverse)])
    }

    var body: some View {
        LazyVStack(spacing: .spacingMedium) {
            ForEach(workouts) { workout in
                WorkoutTileView(viewData: .init(workout: workout))
            }
        }
        .padding(top: .spacingMedium, horizontal: .spacingMedium)
        .embedInScrollView(fixFlickering: true)
        .backgroundIgnoringSafeArea(Color.backgroundMain)
    }
}


// MARK: - Preview

struct WorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutsView()
    }
}
