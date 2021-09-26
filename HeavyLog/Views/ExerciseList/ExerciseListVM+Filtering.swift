//
//  ExerciseListVM+Filtering.swift
//  ExerciseListVM+Filtering
//
//  Created by Sebastian Staszczyk on 26/09/2021.
//

import Foundation

extension ExerciseListVM {

    struct Filtering: Equatable {
        var searchText = ""
        var selectedTab = Tab.buildIn

        enum Tab: Int {
            case buildIn
            case own
        }

        var predicates: [NSPredicate] {
            let text = searchText.isEmpty ? nil : Filter.withName(searchText).get
            let tab = (selectedTab == .buildIn ? Filter.builtIn : Filter.addedByUser).get
            return [text, tab].compactMap { $0 }
        }
    }
}

// MARK: - Filtering Tab

extension ExerciseListVM.Filtering.Tab: Identifiable, CaseIterable {

    var title: String {
        switch self {
        case .buildIn:
            return "Built-in"
        case .own:
            return "Own"
        }
    }

    var id: Int { rawValue }
}

