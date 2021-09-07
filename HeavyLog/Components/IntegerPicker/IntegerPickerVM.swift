//
//  IntegerPickerVM.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 06/09/2021.
//

import Foundation

final class IntegerPickerVM: ObservableObject {

    @Published var selectedValue: Int
    let rangeOfValues: ClosedRange<Int>
    let title: String

    init(title: String, rangeOfValues: ClosedRange<Int>, initialValue: Int? = nil) {
        self.title = title
        self.rangeOfValues = rangeOfValues
        self.selectedValue = initialValue ?? rangeOfValues.first!
    }
}

extension IntegerPickerVM {
    static var repsPicker: IntegerPickerVM {
        .init(title: "Reps picker", rangeOfValues: 1...30, initialValue: 5)
    }
}
