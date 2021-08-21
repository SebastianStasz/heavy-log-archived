//
//  ToastPresenter.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import Combine
import SwiftUI

struct ToastPresenter: ViewModifier {

    @ObservedObject var presenter: ToastPresenterVM

    func body(content: Content) -> some View {
        ZStack(alignment: .top) {

            content.infiniteFrame

            if let toast = presenter.toast, presenter.isToastPresented {
                Toast1View(toast: toast, dismiss: toast.isDismissable ? dismiss : nil)
                    .transition(.offset(y: -120))
                    .animation(.interpolatingSpring(mass: 0.3, stiffness: 20, damping: 10, initialVelocity: 1))
                    .padding(.horizontal, 16)
                    .zIndex(100)
            }
        }
    }

    private func dismiss() {
        presenter.dismiss.send()
    }
}

extension View {
    func toastPresenter(viewModel: ToastPresenterVM) -> some View {
        self.modifier(ToastPresenter(presenter: viewModel))
    }
}
