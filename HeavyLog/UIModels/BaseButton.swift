//
//  BaseButton.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

enum BaseButton {
    case action
    case secondary

    var backgroundColor: Color {
        switch self {
        case .action:
            return .actionPrimary
        case .secondary:
            return .basicSecondary
        }
    }

    var textColor: Color {
        switch self {
        case .action:
            return .basicPrimary
        case .secondary:
            return .grayDarkPrimary
        }
    }
}
