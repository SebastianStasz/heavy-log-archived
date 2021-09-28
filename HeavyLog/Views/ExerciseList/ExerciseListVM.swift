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

    private var cancellables: Set<AnyCancellable> = []
    private(set) var fetchRequest: FetchRequest<ExerciseEntity>
    var onTap: ((ExerciseEntity) -> Void)?

    struct Input {
        let filterBtnTap = PassthroughSubject<Void, Never>()
    }

    let input = Input()

    @Published var searchText = ""
    @Published var filterVM = ExerciseFilterVM()
    @Published var navigator: ExerciseListNavigator!

    var areUserExercises: Bool {
        ExerciseEntity.areUserExercises(in: controller.context)
    }

    init() {
        fetchRequest = ExerciseEntity.all(sorting: [.byName()])
        navigator = ExerciseListNavigator(viewModel: self)

        $searchText
            .removeDuplicates()
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .map { $0.count > 2 ? $0 : "" }
            .sink { [weak self] text in
                self?.filterVM.searchText = text
            }
            .store(in: &cancellables)

        input.filterBtnTap
            .combineLatest($filterVM)
            .map { _, filter in filter }
            .removeDuplicates()
            .print()
            .sink { [weak self] filter in
                self?.fetchRequest.applyFiltering(filter.filters)
            }
            .store(in: &cancellables)
    }
}

extension Publisher {
  func withLatestFrom<P>(
    _ other: P
  ) -> AnyPublisher<(Self.Output, P.Output), Failure> where P: Publisher, Self.Failure == P.Failure {
    let other = other
      // Note: Do not use `.map(Optional.some)` and `.prepend(nil)`.
      // There is a bug in iOS versions prior 14.5 in `.combineLatest`. If P.Output itself is Optional.
      // In this case prepended `Optional.some(nil)` will become just `nil` after `combineLatest`.
      .map { (value: $0, ()) }
      .prepend((value: nil, ()))

    return map { (value: $0, token: UUID()) }
      .combineLatest(other)
      .removeDuplicates(by: { (old, new) in
        let lhs = old.0, rhs = new.0
        return lhs.token == rhs.token
      })
      .map { ($0.value, $1.value) }
      .compactMap { (left, right) in
        right.map { (left, $0) }
      }
      .eraseToAnyPublisher()
  }
}
