//
//  ExerciseTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import SwiftUI

struct ExerciseTileViewData {
    let title: String
    let type: String
    let color: Color
    let bodyParts: String

    var headerViewData: DoubleTextHeaderViewData {
        .init(title: title, subtitle: type, color: color)
    }
}


// MARK: - Sample Data

extension ExerciseTileViewData {
    static let sample1 = ExerciseTileViewData(title: "Bench press", type: "Push", color: .accentOrangeLight, bodyParts: "Chest, shoulders, tricpeps")
}
