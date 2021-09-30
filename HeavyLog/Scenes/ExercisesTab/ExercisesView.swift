//
//  ExercisesView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 15/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExercisesView: View {

    @StateObject private var viewModel = ExercisesVM()

    var body: some View {
        ExerciseListView(viewModel: viewModel.exerciseListVM)
            .navigation(item: $viewModel.exerciseDetailsVM) { ExerciseDetailsView(viewModel: $0) }
    }
}


// MARK: - Preview

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
