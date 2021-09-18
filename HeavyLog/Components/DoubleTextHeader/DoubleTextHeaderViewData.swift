//
//  DoubleTextHeaderViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI
import Shared

struct DoubleTextHeaderViewData {
    let title: String
    let subtitle: String
    let color: Color
}

// MARK: - View Initializer

extension DoubleTextHeader {
    init(viewData: DoubleTextHeaderViewData) {
        title = viewData.title
        subtitle = viewData.subtitle
        color = viewData.color
    }
}

// MARK: - Sample Data

extension DoubleTextHeaderViewData {
    static let sample1 = DoubleTextHeaderViewData(title: "Sample title", subtitle: Date().string(format: .medium), color: .accentOrange)
}
