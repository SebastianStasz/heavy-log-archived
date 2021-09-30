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
    let input = Input()

    deinit {
        print("ExerciseFilterVM deinit")
    }

    func makeOutput() -> Output {
        input.viewDisappeared
            .sink { [unowned self] in
                form = temporaryForm
            }
            .store(in: &cancellables)

        let resetToDefaults = input.resetToDefaultBtnTap
            .handleEvents(receiveOutput: { [unowned self] _ in
                form.resetToDefault()
            })

        let filters = Publishers.Merge(input.filterBtnTap, resetToDefaults)
            .handleEvents(receiveOutput: { [unowned self] _ in
                temporaryForm = form
            })
            .compactMap { [unowned self] _ in
                form.filters
            }
            .prepend([])
            .eraseToAnyPublisher()

        return Output(filters: filters)
    }
}

