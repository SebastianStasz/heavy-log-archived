//
//  IntegerPickerView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import SwiftUI

struct IntegerPickerView: View {

    @ObservedObject var viewModel: IntegerPickerVM
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?

    init(viewModel: IntegerPickerVM, maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil) {
        self.viewModel = viewModel
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }

    var body: some View {
        Picker(viewModel.title, selection: $viewModel.selectedValue) {
            ForEach(viewModel.rangeOfValues, id: \.self) {
                Text($0.str)
            }
        }
        .frame(maxWidth: maxWidth, maxHeight: maxHeight)
        .clipped()
    }
}


// MARK: - Preview

struct IntegerPickerView_Previews: PreviewProvider {
    static var previews: some View {
        IntegerPickerView(viewModel: .repsPicker)
    }
}
