//
//  TextFieldView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import SwiftUI

struct TextFieldView: View {

    @ObservedObject var viewModel: TextFieldVM

    var body: some View {
        VStack(alignment: .leading, spacing: .spacingMicro) {
            TextField(viewModel.placeholder, text: $viewModel.textField)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(viewModel.type)

            if let message = viewModel.validationMessage {
                Text(message)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.accentRed)
            }
        }
    }
}


// MARK: - Preview

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TextFieldView(viewModel: .integer(result: .constant("2")))
        }
        .previewSizeThatFits(backgroundColor: .backgroundSecondary)
    }
}
