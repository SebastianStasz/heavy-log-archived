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

    init() {
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(spacing: .spacingHuge) {
            Form {
                TextField("Workout title", text: $viewModel.workout.title)
                TextEditor(text: $viewModel.workout.notes)

                Section {
                    RatePicker(title: "Workout rating", selectedValue: $viewModel.workout.rate)
                }
                .plainStyle()

                Section {
                    BaseListView(title: "Info", viewModel: viewModel.workoutInfoListVM)
                }
                .plainStyle()
            }
            .padding(.horizontal, -20)
            .padding(.bottom, -110)
        }
    }
}


// MARK: - Preview

struct WorkoutInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WorkoutCreatorVM()

        WorkoutInfoView()
            .environmentObject(viewModel)
            .padding(.horizontal, .spacingMedium)
            .backgroundIgnoringSafeArea(Color.backgroundMain)
            .embedInNavigationView(title: "Workout Info", displayMode: .inline)
    }
}
