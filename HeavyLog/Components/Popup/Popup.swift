//
//  Popup.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Shared
import SwiftUI

struct Popup: View {

    let viewModel: PopupVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingHuge) {
            Text(viewModel.title).textHeadlineBigBold

            if let message = viewModel.message {
                Text(message).textBodyNormal
            }

            HStack(spacing: .spacingSmall) {
                Button(.common_cancel, action: viewModel.dismissPopup())
                    .buttonStyle(BaseButtonStyle(.secondary))
                    .displayIf(viewModel.shouldDisplayCancelButton)

                Button(.common_ok, action: viewModel.action())
                    .buttonStyle(BaseButtonStyle(.action))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.spacingBig)
        .frame(width: UIScreen.width - 2 * CGFloat.spacingMedium)
        .background(Color.backgroundSecondary)
        .cornerRadius(.cornerRadiusBase)
        .shadow(radius: 10)
    }
}


// MARK: - Preview

struct Popup_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Popup(viewModel: .init(.sampleInfo, dismiss: {}))
            Popup(viewModel: .init(.sampleAction, dismiss: {}))
        }
        .previewSizeThatFits()
    }
}
