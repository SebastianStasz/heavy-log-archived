//
//  DoubleTextViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import Foundation

struct DoubleTextViewData: Hashable {
    let leftText: String
    let rightText: String

    init(_ leftText: String, _ rightText: String) {
        self.leftText = leftText
        self.rightText = rightText
    }
}
