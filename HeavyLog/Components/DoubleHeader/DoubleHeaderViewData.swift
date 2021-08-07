//
//  DoubleHeaderViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct DoubleHeaderViewData {
    let title: String
    let subtitle: String
    let color: Color
}

// MARK: - View Initializer

extension DoubleHeaderView {
    init(viewData: DoubleHeaderViewData) {
        title = viewData.title
        subtitle = viewData.subtitle
        color = viewData.color
    }
}

// MARK: - Sample Data

extension DoubleHeaderViewData {
    static let sample1 = DoubleHeaderViewData(title: "Sample title", subtitle: Date().string(format: .medium), color: .accentOrange)
}
