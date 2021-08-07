//
//  WorkoutSmallTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct WorkoutSmallTileViewData {
    let headerViewData: DoubleTextHeaderViewData
    let doubleTextViewData: DoubleTextViewData

    init(title: String, date: String, color: Color, leftText: String, rightText: String) {
        headerViewData = .init(title: title, subtitle: date, color: color)
        doubleTextViewData = .init(leftText, rightText)
    }
}


// MARK: - Sample Data

extension WorkoutSmallTileViewData {
    static let sample1 = WorkoutSmallTileViewData(title: "FBW A", date: Date().string(format: .medium), color: .accentOrangeLight, leftText: "5 exercises", rightText: "01:27 h")
}
