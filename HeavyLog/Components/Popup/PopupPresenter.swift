//
//  PopupPresenter.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

struct PopupPresenter: View {

    @Binding private var popup: PopupModel?

    init(_ popup: Binding<PopupModel?>) {
        self._popup = popup
    }

    var body: some View {
        ZStack {
            if let popup = popup {
                Popup(viewModel: .init(popup, dismiss: dismissPopup))
                    .dimBackground()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.08))
    }

    private func dismissPopup() {
        popup = nil
    }
}


// MARK: - Preview

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupPresenter(.constant(.sampleInfo))
    }
}
