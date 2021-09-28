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
        var filters: AnyPublisher<[Filter], Never>
    }

    private var cancellables: Set<AnyCancellable> = []
    private(set) var fetchRequest: FetchRequest<ExerciseEntity>
    var onTap: ((ExerciseEntity) -> Void)?

    @Published var searchText = ""
    @Published var selectedTab: Tab = .builtIn
    @Published var filterVM: ExerciseFilterVM!
    @Published var navigator: ExerciseListNavigator!

    var areUserExercises: Bool {
        ExerciseEntity.areUserExercises(in: controller.context)
    }

    func makeOutput() -> Output {
        let filterFormOutput = filterVM.makeOutput()

        let filters: AnyPublisher<[Filter], Never> = Publishers.CombineLatest3($searchText, $selectedTab, filterFormOutput.filters)
            .dropFirst()
            .map { text, tab, filters in
                [Filter.byName(text), .byKind(tab.filter)] + filters
            }
            .eraseToAnyPublisher()

        return Output(filters: filters)
    }

    init() {
        fetchRequest = ExerciseEntity.all(sorting: [.byName()])
        navigator = ExerciseListNavigator(viewModel: self)
        filterVM = ExerciseFilterVM(dismissSheet: { [weak self] in
            self?.navigator.navigate(to: .exerciseList)
        })

        let output = makeOutput()

        output.filters
            .sink { [weak self] filters in
                self?.fetchRequest.applyFiltering(filters)
            }
            .store(in: &cancellables)

//        $searchText
//            .removeDuplicates()
//            .debounce(for: 0.3, scheduler: RunLoop.main)
//            .map { $0.count > 2 ? $0 : "" }
//            .sink { [weak self] text in
//                self?.filterVM.searchText = text
//            }
//            .store(in: &cancellables)
//
//        input.filterBtnTap
//            .combineLatest($filterVM)
//            .map { _, filter in filter }
//            .removeDuplicates()
//            .print()
//            .sink { [weak self] filter in
//                self?.fetchRequest.applyFiltering(filter.filters)
//            }
//            .store(in: &cancellables)
    }
}

// MARK: - Tab

extension ExerciseListVM {
    enum Tab: Int, Identifiable, CaseIterable {
        case builtIn
        case own

        var title: String {
            switch self {
            case .builtIn:
                return .common_builtin
            case .own:
                return .common_own
            }
        }

        var filter: Filter.Kind {
            switch self {
            case .builtIn:
                return Filter.Kind.builtIn
            case .own:
                return Filter.Kind.addedByUser
            }
        }

        var id: Int { rawValue }
    }
}

//extension Publisher {
//    func combineLatestOptional<Other: Publisher>(_ other: Other)
//        -> AnyPublisher<(Output, Other.Output?), Failure>
//        where Other.Failure == Failure {
//
//            self.compactMap { Optional.some($0) }.prepend(nil)
//            .combineLatest(
//                other.map { Optional.some($0) }.prepend(nil)
//            )
//            .dropFirst() // drop the first (nil, nil)
//            .eraseToAnyPublisher()
//    }
//}

//extension Set {
//    func insert<T>(contentsOf set: Set<T>) {
//        for element in set {
//            self.insert(element)
//        }
//    }
//}
