//
//  PopupView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import Shared
import SwiftUI

struct PopupView: View {

    @ObservedObject var viewModel: PopupVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingHuge) {
            Text(viewModel.title).textHeadlineBigBold

            VStack(alignment: .leading, spacing: .spacingBig) {
                VStack(alignment: .leading, spacing: .spacingSmall) {
                    if let message = viewModel.message {
                        Text(message).textBodyNormal
                    }

                    if let inputVM = viewModel.textFieldVM {
                        TextFieldView(viewModel: inputVM)
                    }
                }

                if let picker = viewModel.picker {
                    VStack(alignment: .leading, spacing: .spacingSmall) {
                        Text(picker.hint).textBodyNormal
                        IntegerPickerView(viewModel: picker.viewModel, maxHeight: 100)
                    }
                }
            }

            HStack(spacing: .spacingSmall) {
                Button(.common_cancel, action: viewModel.dismissPopup)
                    .buttonStyle(BaseButtonStyle(.secondary))
                    .displayIf(viewModel.shouldDisplayCancelButton)

                Button(.common_ok, action: viewModel.action)
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
            PopupView(viewModel: .init(.sampleInfo, dismiss: {}))
            PopupView(viewModel: .init(.sampleAction, dismiss: {}))
            PopupView(viewModel: .init(.sampleTextField, dismiss: {}))
            PopupView(viewModel: .init(.sampleTextFieldAndPicker, dismiss: {}))
        }
        .previewSizeThatFits()
    }
}
