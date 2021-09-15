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
    case destructive

    var backgroundColor: Color {
        switch self {
        case .action:
            return .actionPrimary
        case .secondary:
            return .basicSecondary
        case .destructive:
            return .accentRed
        }
    }

    var textColor: Color {
        switch self {
        case .action:
            return .basicPrimary
        case .secondary:
            return .grayDarkPrimary
        case .destructive:
            return .basicPrimary
        }
    }
}
