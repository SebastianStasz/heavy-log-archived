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
    @Published var searchText = ""
    @Published var filter = Filtering()

    var areUserExercises: Bool {
        ExerciseEntity.areUserExercises(in: controller.context)
    }

    init() {
        fetchRequest = ExerciseEntity.all(sorting: [.byName()])

        $searchText
            .removeDuplicates()
            .debounce(for: 0.3, scheduler: RunLoop.main)
            .map { $0.count > 2 ? $0 : "" }
            .sink { [weak self] text in
                self?.filter.searchText = text
            }
            .store(in: &cancellables)

        $filter
            .dropFirst()
            .removeDuplicates()
            .sink { [weak self] filter in
                self?.fetchRequest.applyFiltering(filter.predicates)
            }
            .store(in: &cancellables)
    }
}
