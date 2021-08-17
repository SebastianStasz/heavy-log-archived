//
//  Design.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

public enum Spacing {
    case small
    case medium
    case big
    case huge

    public var value: CGFloat {
        switch self {
        case .small:
            return 12
        case .medium:
            return 16
        case .big:
            return 24
        case .huge:
            return 32
        }
    }

}

public enum CornerRadius {
    case base

    public var value: CGFloat {
        switch self {
        case .base:
            return 10
        }
    }
}

public extension CGFloat {

    /// Corner radius of 10.
    static var cornerRadiusBase: CGFloat {
        CornerRadius.base.value
    }

    /// Spacing of 12.
    static var spacingSmall: CGFloat {
        Spacing.small.value
    }

    /// Spacing of 16.
    static var spacingMedium: CGFloat {
        Spacing.medium.value
    }

    /// Spacing of 24.
    static var spacingBig: CGFloat {
        Spacing.big.value
    }

    /// Spacing of 32.
    static var spacingHuge: CGFloat {
        Spacing.huge.value
    }
}
