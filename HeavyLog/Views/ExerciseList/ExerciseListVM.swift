//
//  ExerciseListVM.swift
//  ExerciseListVM
//
//  Created by Sebastian Staszczyk on 25/09/2021.
//

import Combine
import HeavyLogCoreData
import Foundation
import SwiftUI

final class ExerciseListVM: ObservableObject {
    typealias Filter = ExerciseEntity.Filter

    struct Output {
        let filters: AnyPublisher<[Filter], Never>
    }

    private var cancellables: Set<AnyCancellable> = []
    private var filterVM = ExerciseFilterVM()
    private(set) var fetchRequest: FetchRequest<ExerciseEntity>
    var onTap: ((ExerciseEntity) -> Void)?

    @Published var searchText = ""
    @Published var navigator = ExerciseListNavigator()

    var areUserExercises: Bool {
        ExerciseEntity.areUserExercises(in: controller.context)
    }

    init() {
        fetchRequest = ExerciseEntity.all(sorting: [.byName()], filtering: [.byKind(.builtIn)])
        let filterFormOutput = filterVM.makeOutput()

        let nameFilter = $searchText
            .removeDuplicates()
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .map { $0.count > 2 ? $0 : "" }

        Publishers.CombineLatest3(nameFilter, $navigator, filterFormOutput.filters)
            .dropFirst()
            .map { name, navigator, filters in
                [Filter.byName(name), .byKind(navigator.selectedTab.filter)] + filters
            }
            .sink { [unowned self] filters in
                navigate(to: .exerciseList)
                fetchRequest.applyFiltering(filters)
            }
            .store(in: &cancellables)
    }

    func navigate(to destination: ExerciseListNavigator.Destination) {
        switch destination {
        case .exerciseList:
            navigator.sheet = nil
        case .exerciseFilterSheet:
            navigator.sheet = .exerciseFilter(filterVM)
        }
    }
}

