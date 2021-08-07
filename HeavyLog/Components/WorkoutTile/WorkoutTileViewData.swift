//
//  WorkoutTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct WorkoutTileViewData {
    let headerViewData: DoubleTextHeaderViewData
    let doubleTextRows: [DoubleTextViewData]

    init(title: String, date: String, color: Color, efforts: [(String, String)]) {
        assert(efforts.isNotEmpty, "Initialization with an empty efforts array should not happend.")
        headerViewData = .init(title: title, subtitle: date, color: color)
        doubleTextRows = efforts.map { .init($0.0, $0.1) }
    }

    func isLast(_ row: DoubleTextViewData) -> Bool {
        doubleTextRows.last == row
    }
}


// MARK: - Sample Data

extension WorkoutTileViewData {
    static private let efforts = [("Deadlift", "150kg 3x1, 150kg x3 x2"), ("OHP", "40kg 4x8"), ("Machine leg extensions", "11kg 4x10"), ("Dumbbell rowing", "27.5kg 4x8")]
    static let sample1 = Self.init(title: "FBW A", date: Date().string(format: .medium), color: .accentOrangeLight, efforts: Self.efforts)
}
