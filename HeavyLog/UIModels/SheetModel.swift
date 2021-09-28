//
//  SheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import HeavyLogCoreData
import SwiftUI

enum SheetModel: View {
    case workout(viewModel: WorkoutCreatorVM)
    case workoutTemplateList(onTap: (WorkoutTemplateEntity) -> Void)

    var body: some View {
        switch self {
        case let .workout(vm):
            WorkoutCreatorView(viewModel: vm)
        case let .workoutTemplateList(action):
            WorkoutTemplateListView(onTap: action)
        }
    }
}

extension SheetModel: Identifiable {
    var id: Int {
        switch self {
        case .workout: return 0
        case .workoutTemplateList: return 1
        }
    }
}
