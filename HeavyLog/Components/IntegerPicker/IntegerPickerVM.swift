//
//  IntegerPickerVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import Foundation

final class IntegerPickerVM: ObservableObject {

    @Published var selectedValue: Int?
    let rangeOfValues: ClosedRange<Int>

    init(rangeOfValues: ClosedRange<Int>, initialValue: Int? = nil) {
        self.rangeOfValues = rangeOfValues
        self.selectedValue = initialValue ?? rangeOfValues.first
    }
}
