//
//  IntegerPickerView.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import SwiftUI

struct IntegerPickerView: View {

    @ObservedObject private var viewModel: IntegerPickerVM
    private let title: String
    private let maxWidth: CGFloat?
    private let maxHeight: CGFloat?

    init(viewModel: IntegerPickerVM, title: String, maxWidth: CGFloat? = nil, maxHeight: CGFloat? = nil) {
        self.viewModel = viewModel
        self.title = title
        self.maxWidth = maxWidth
        self.maxHeight = maxHeight
    }

    var body: some View {
        Picker(title, selection: $viewModel.selectedValue) {
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
        let vm = IntegerPickerVM(rangeOfValues: 1...20, initialValue: 5)
        IntegerPickerView(viewModel: vm, title: "Number of reps", maxHeight: 100)
    }
}
