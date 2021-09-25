//
//  ExerciseTileViewData.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 07/08/2021.
//

import HeavyLogCoreData
import SwiftUI

struct ExerciseTileViewData {

    enum Icon {
        case chevron
        case plus
        case none
    }

    let title: String
    let icon: Icon

    init(title: String, icon: Icon = .none) {
        self.title = title
        self.icon = icon
    }
}

// MARK: - Icon Body

extension ExerciseTileViewData.Icon: View {
    var body: some View {
        switch self {
        case .chevron:
            ChevronIcon()
        case .plus:
            PlusIcon()
        case .none:
            EmptyView()
        }
    }
}


// MARK: - Sample Data

extension ExerciseTileViewData {
    static let benchPressChevron = ExerciseTileViewData(title: "Bench press", icon: .chevron)
    static let benchPressPlus = ExerciseTileViewData(title: "Bench press", icon: .plus)
    static let benchPressNone = ExerciseTileViewData(title: "Bench press", icon: .none)
    static let sampleLongNone = ExerciseTileViewData(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.", icon: .none)
}
