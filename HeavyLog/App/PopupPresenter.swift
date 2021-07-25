//
//  PopupPresenter.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI

struct PopupPresenter: ViewModifier {

    @ObservedObject var appVM: AppVM

    func body(content: Content) -> some View {
            content
                .toastPresenter(viewModel: appVM.toastPresenter)
                .actionSheet(item: $appVM.actionSheet) { $0.body }
                .alert(item: $appVM.alert) { $0.body }
    }
}

extension View {
    func popupPresenter(appVM: AppVM) -> some View {
        self.modifier(PopupPresenter(appVM: appVM))
    }
}
