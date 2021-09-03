//
//  Spacing.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 03/09/2021.
//

import SwiftUI

public enum Spacing: CGFloat, Layout {
    case small  = 12
    case medium = 16
    case big    = 24
    case huge   = 32
}

public extension CGFloat {

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
