//
//  WorkoutInfoVM.swift
//  WorkoutInfoVM
//
//  Created by Sebastian Staszczyk on 30/09/2021.
//

import Combine
import Foundation

final class WorkoutInfoVM: ObservableObject {

    private let timer = Timer.publish(every: 60.05, on: .main, in: .default).autoconnect()
    private var cancellables: Set<AnyCancellable> = []
    @Published var form = WorkoutForm()
    @Published private(set) var workoutInfoListVM = BaseListVM()

    init() {
        $form.sink { [weak self] form in
            self?.workoutInfoListVM.rows = form.info
        }
        .store(in: &cancellables)

        timer.sink { [weak self] date in
            self?.form.updateDuration(for: date)
        }
        .store(in: &cancellables)
    }
}
