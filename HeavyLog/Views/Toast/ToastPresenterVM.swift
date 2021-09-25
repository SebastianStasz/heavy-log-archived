//
//  ToastPresenterVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Combine
import Foundation

final class ToastPresenterVM: ObservableObject {

    @Published private(set) var isToastPresented = false
    @Published private(set) var toast: ToastModel?
    let dismiss = PassthroughSubject<Void, Never>()

    private var canPresentNext = true
//    private var toastQueue: [ToastModel] = []
    private var cancellables: Set<AnyCancellable> = []
    private let autoDismiss = PassthroughSubject<Double, Never>()

    func presentToast(_ toast: ToastModel) {
        guard canPresentNext else { return }
        self.toast = toast
    }

    init() {
        dismiss // Dismiss toast & check next
            .map { [unowned self] in isToastPresented = false }
            .debounce(for: .seconds(0.6), scheduler: RunLoop.main)
            .map { [unowned self] in toast = nil }
            .debounce(for: .seconds(0.6), scheduler: RunLoop.main)
            .sink { [unowned self] in canPresentNext = true }
            .store(in: &cancellables)

        dismiss // Combine dismiss and autoDismiss
            .map { [unowned self] in delayedDissmis }
            .switchToLatest()
            .sink { [unowned self] t in
                dismiss.send()
            }
            .store(in: &cancellables)

        $toast // Present toast
            .compactMap { $0 }
            .sink { [unowned self] toast in
                canPresentNext = false
                isToastPresented = true
                autoDismiss.send(toast.presentingTime)
            }
            .store(in: &cancellables)

        dismiss.send()
    }

    private var delayedDissmis: AnyPublisher<(), Never> {
        autoDismiss.flatMap { delay in
            Just(()).delay(for: .seconds(delay), scheduler: RunLoop.main)
        }
        .eraseToAnyPublisher()
    }
}


