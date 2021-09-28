//
//  ExerciseListNavigator.swift
//  ExerciseListNavigator
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import SwiftUI

struct ExerciseListNavigator {
    enum Destination {
        case exerciseList
        case exerciseFilterSheet
    }

    var sheet: Sheet?

    private let viewModel: ExerciseListVM

    init(viewModel: ExerciseListVM) {
        self.viewModel = viewModel
    }

    mutating func navigate(to destination: Destination) {
        switch destination {
        case .exerciseList:
            sheet = nil
        case .exerciseFilterSheet:
            sheet = .exerciseFilter(viewModel)
        }
    }

    enum Sheet: View, Identifiable {
        case exerciseFilter(ExerciseListVM)

        var body: some View {
            switch self {
            case let .exerciseFilter(viewModel):
                ExerciseFilterView(viewModel: viewModel.filterVM)
            }
        }

        var id: Int {
            switch self {
            case .exerciseFilter:
                return 0
            }
        }
    }
}
