//
//  CornerRadius.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 24/07/2021.
//

import SwiftUI

public enum CornerRadius: CGFloat, Layout {
    case base = 12
}

public extension CGFloat {

    /// Corner radius of 10.
    static var cornerRadiusBase: CGFloat {
        CornerRadius.base.value
    }
}
