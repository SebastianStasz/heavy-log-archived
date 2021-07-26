//
//  Design.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

enum Spacing {
    case small
    case medium
    case big

    var value: CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 16
        case .big:
            return 24
        }
    }

}

enum CornerRadius {
    case base

    var value: CGFloat {
        switch self {
        case .base:
            return 10
        }
    }
}

extension CGFloat {

    static var cornerRadiusBase: CGFloat {
        CornerRadius.base.value
    }

    static var spacingSmall: CGFloat {
        Spacing.small.value
    }

    static var spacingMedium: CGFloat {
        Spacing.medium.value
    }

    static var spacingBig: CGFloat {
        Spacing.big.value
    }
}
