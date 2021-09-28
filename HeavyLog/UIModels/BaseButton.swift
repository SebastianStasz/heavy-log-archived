//
//  BaseButton.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 04/09/2021.
//

import SwiftUI

enum BaseButton {
    case action(BaseButtonSize)
    case secondary(BaseButtonSize)
    case destructive(BaseButtonSize)

    var backgroundColor: Color {
        switch self {
        case .action:
            return .actionPrimary
        case let .secondary(size):
            return size == .medium ? .basicSecondary : .grayDarkSecondary
        case .destructive:
            return .accentRed
        }
    }

    var textColor: Color {
        switch self {
        case .action:
            return .basicPrimary
        case let .secondary(size):
            return size == .medium ? .grayDarkPrimary : .basicPrimary
        case .destructive:
            return .basicPrimary
        }
    }

    var size: BaseButtonSize {
        switch self {
        case let .action(size), let .secondary(size), let .destructive(size):
            return size
        }
    }
}
