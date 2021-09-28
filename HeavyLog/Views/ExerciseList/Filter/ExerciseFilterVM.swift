//
//  ExerciseFilterVM.swift
//  ExerciseFilterVM
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import Combine
import HeavyLogCoreData
import Foundation
import SwiftUI

final class ExerciseFilterVM: ObservableObject {
    struct Input {
        let viewDisappeared = PassthroughSubject<Void, Never>()
        let filterBtnTap = PassthroughSubject<Void, Never>()
        let resetToDefaultBtnTap = PassthroughSubject<Void, Never>()
    }

    struct Output {
        let filters: AnyPublisher<[ExerciseEntity.Filter], Never>
    }

    @Published var form = ExerciseFilterForm()
    private var temporaryForm = ExerciseFilterForm()

    private var cancellables: Set<AnyCancellable> = []
    private let dismissSheet: () -> Void
    let input = Input()

    init(dismissSheet: @escaping () -> Void) {
        self.dismissSheet = dismissSheet
    }

    func makeOutput() -> Output {
        input.viewDisappeared
            .sink { self.form = self.temporaryForm }
            .store(in: &cancellables)

        let resetToDefaults = input.resetToDefaultBtnTap
            .handleEvents(receiveOutput: { _ in
                self.form.resetToDefault()
            })

        let filters = Publishers.Merge(input.filterBtnTap, resetToDefaults)
            .handleEvents(receiveOutput: { _ in
                self.temporaryForm = self.form
                self.dismissSheet()
            })
            .map { self.form.filters }
            .prepend([])
            .eraseToAnyPublisher()

        return Output(filters: filters)
    }
}

