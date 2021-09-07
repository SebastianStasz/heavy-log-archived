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
        TextField(viewModel.placeholder, text: $viewModel.value)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(viewModel.type)
    }
}


// MARK: - Preview

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = TextFieldVM(placeholder: "Integer value", type: .decimalPad)
        TextFieldView(viewModel: vm)
    }
}
