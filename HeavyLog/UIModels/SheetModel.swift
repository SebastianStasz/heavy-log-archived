//
//  SheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

enum SheetModel: View {
    case workout(viewModel: WorkoutCreatorVM)

    var body: some View {
        switch self {
        case let .workout(vm):
            WorkoutCreatorView(viewModel: vm)
        }
    }
}

extension SheetModel: Identifiable {
    var id: Int {
        switch self {
        case .workout: return 0
        }
    }
}
