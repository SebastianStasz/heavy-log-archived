//
//  WorkoutInfoView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 21/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct WorkoutInfoView: View {

    @EnvironmentObject var viewModel: WorkoutCreatorVM

    //    init() {
    //        UITableView.appearance().backgroundColor = .green
    //    }

    var body: some View {
        VStack(spacing: .spacingHuge) {
            Form {
                TextField("Workout title", text: $viewModel.workout.title)
                TextField("Notes", text: $viewModel.workout.notes)
            }
            .padding(.top, -82)
            .padding(.horizontal, -20)
            .frame(height: 88)

            RatePicker(title: "Workout rating", selectedValue: $viewModel.workout.rate)

            BaseListView(title: "Info", viewModel: viewModel.workoutInfoListVM)
        }
    }
}


// MARK: - Preview

struct WorkoutInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WorkoutCreatorVM()

        WorkoutInfoView()
            .environmentObject(viewModel)
            .padding(vertical: .spacingHuge, horizontal: .spacingMedium)
            .backgroundIgnoringSafeArea(Color.backgroundMain)
    }
}
