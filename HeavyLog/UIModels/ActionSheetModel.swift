//
//  ActionSheetModel.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 25/07/2021.
//

import SwiftUI


enum ActionSheetModel: Int {
    case test

    var body: ActionSheet {
        switch self {
        case .test:
            return ActionSheet(title: Text("Test"))
        }
    }
}

extension ActionSheetModel: Identifiable {
    var id: Int { rawValue }
}

