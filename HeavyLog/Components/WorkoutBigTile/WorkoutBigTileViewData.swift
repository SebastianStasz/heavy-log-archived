//
//  WorkoutBigTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct WorkoutBigTileViewData {
    let title: String
    let date: String
    let color: Color
    let efforts: [(String, String)]

    init(title: String, date: String, color: Color, efforts: [(String, String)]) {
        assert(efforts.isNotEmpty, "Initialization with an empty efforts array should not happend.")
        self.title = title
        self.date = date
        self.color = color
        self.efforts = efforts
    }
}


// MARK: - Sample Data

extension WorkoutBigTileViewData {
    static private let efforts = [("Deadlift", "150kg 3x1, 150kg x3 x2"), ("OHP", "40kg 4x8"), ("Machine leg extensions", "11kg 4x10"), ("Dumbbell rowing", "27.5kg 4x8")]
    static let sample1 = Self.init(title: "FBW A", date: Date().string(format: .medium), color: .accentOrangeLight, efforts: Self.efforts)
}
