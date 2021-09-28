//
//  SegmentedPicker.swift
//  SegmentedPicker
//
//  Created by Sebastian Staszczyk on 27/09/2021.
//

import HeavyLogCoreData
import SwiftUI

struct SegmentedPicker<SelectionValue, Option>: View where SelectionValue: Pickerable, Option: Pickerable {

    @Binding private var selection: SelectionValue
    private let options: [Option]
    private let title: String

    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(options) { Text($0.name).tag($0) }
        }
        .pickerStyle(.segmented)
    }

    init(_ title: String, selection: Binding<SelectionValue>, options: [Option]) {
        self.title = title
        self._selection = selection
        self.options = options
    }
}


// MARK: - Preview

struct SegmentedPicker_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedPicker("Title", selection: .constant(Difficulty.easy), options: Difficulty.allCases)
            .previewSizeThatFits()
    }
}
